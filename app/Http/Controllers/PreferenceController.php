<?php

namespace App\Http\Controllers;

use App\Models\Article;
use App\Models\Preference;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

/**
 * @OA\Tags(
 *     title="User Preferences API",
 *     version="1.0",
 *     description="API for managing user preferences."
 * )
 */

/**
 * @OA\Schema(
 *     schema="Preference",
 *     type="object",
 *     @OA\Property(property="id", type="integer", format="int64", example=1),
 *     @OA\Property(property="user_id", type="integer", format="int64", example=1),
 *     @OA\Property(property="sources", type="array", @OA\Items(type="string")),
 *     @OA\Property(property="categories", type="array", @OA\Items(type="string")),
 *     @OA\Property(property="authors", type="array", @OA\Items(type="string")),
 *     @OA\Property(property="created_at", type="string", format="date-time", example="2024-10-11T12:34:56Z"),
 *     @OA\Property(property="updated_at", type="string", format="date-time", example="2024-10-11T12:34:56Z"),
 * )
 */

class PreferenceController extends Controller
{
    /**
     * Helper method to implode an array into a comma-separated string.
     */
    private function implodeArray($array)
    {
        return is_array($array) ? implode(',', $array) : $array;
    }

    /**
     * @OA\Post(
     *     path="/api/preferences",
     *     tags={"Preferences"},
     *     summary="Set user preferences",
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             @OA\Property(property="sources", type="array", @OA\Items(type="string"), example={"NewsAPI", "The Guardian"}),
     *             @OA\Property(property="categories", type="array", @OA\Items(type="string"), example={"sports", "general"}),
     *             @OA\Property(property="authors", type="array", @OA\Items(type="string"), example={"John Doe", "Jane Smith"}),
     *         ),
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Preferences saved successfully",
     *         @OA\JsonContent(
     *             @OA\Property(property="message", type="string", example="Preferences saved successfully"),
     *             @OA\Property(property="data", type="object", ref="#/components/schemas/Preference")
     *         )
     *     ),
     *     @OA\Response(response=422, description="Validation errors")
     * )
     */
    public function setPreferences(Request $request)
    {
        $request->validate([
            'sources' => 'array',
            'categories' => 'array',
            'authors' => 'array',
        ]);

        $userId = auth()->id();

        $preferences = Preference::updateOrCreate(
            ['user_id' => $userId],
            [
                'sources' => $this->implodeArray($request->sources),
                'categories' => $this->implodeArray($request->categories),
                'authors' => $this->implodeArray($request->authors),
            ]
        );

        return response()->json(['message' => 'Preferences saved successfully', 'data' => $preferences], 200);
    }

    /**
     * @OA\Get(
     *     path="/api/preferences",
     *     tags={"Preferences"},
     *     summary="Get user preferences",
     *     @OA\Response(
     *         response=200,
     *         description="User preferences retrieved successfully",
     *         @OA\JsonContent(ref="#/components/schemas/Preference")
     *     ),
     *     @OA\Response(response=404, description="Preferences not found")
     * )
     */
    public function getPreferences()
    {
        $userId = auth()->id();
        $cacheKey = "user_preferences_{$userId}";

        $preference = Cache::remember($cacheKey, 60, function () use ($userId) {
            return auth()->user()->load('preferences')->preferences;
        });

        if (!$preference) {
            return response()->json(['message' => 'Preferences not found'], 404);
        }

        return response()->json($preference, 200);
    }

    /**
     * @OA\Get(
     *     path="/api/personalized-feed",
     *     tags={"Preferences"},
     *     summary="Get personalized news feed based on user preferences",
     *     @OA\Response(
     *         response=200,
     *         description="Personalized news feed retrieved successfully",
     *         @OA\JsonContent(type="array", @OA\Items(ref="#/components/schemas/Article"))
     *     ),
     *     @OA\Response(response=404, description="No articles found based on preferences")
     * )
     */
    public function personalizedFeed(Request $request)
    {
        try {
            $userId = auth()->id();
            $cacheKey = "personalized_feed_{$userId}";

            $articles = Cache::remember($cacheKey, 60, function () use ($request, $userId) {
                // Retrieve the user's preferences
                $preferences = auth()->user()->preferences;

                // If preferences are not found, throw a custom exception
                if (!$preferences) {
                    throw new ModelNotFoundException('Preferences not found');
                }

                // Split sources, categories, and authors into arrays
                $sources = explode(',', $preferences->sources);
                $categories = explode(',', $preferences->categories);
                $authors = explode(',', $preferences->authors);

                $query = Article::query();

                // Filter articles based on user preferences
                if (!empty($sources)) {
                    $query->whereIn('source', $sources);
                }

                if (!empty($categories)) {
                    $query->whereIn('category', $categories);
                }

                if (!empty($authors)) {
                    $query->whereIn('author', $authors);
                }

                return $query->paginate($request->input('per_page', 10));
            });

            return response()->json($articles, 200);
        } catch (ModelNotFoundException $e) {
            return response()->json(['message' => $e->getMessage()], 404);
        } catch (\Exception $e) {
            return response()->json(['message' => 'An unexpected error occurred: ' . $e->getMessage()], 500);
        }
    }

}
