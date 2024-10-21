<?php

namespace App\Http\Controllers;

use App\Http\Resources\ArticleResource;
use App\Models\Article;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

/**
 * @OA\Tag(
 *     name="Articles",
 *     description="API endpoints for managing articles"
 * )
 */

/**
 * @OA\Schema(
 *     schema="Article",
 *     type="object",
 *     @OA\Property(property="id", type="integer", format="int64", example=1),
 *     @OA\Property(property="title", type="string", example="Sample Article Title"),
 *     @OA\Property(property="content", type="string", example="Content of the article goes here."),
 *     @OA\Property(property="author", type="string", example="Author Name"),
 *     @OA\Property(property="source", type="string", example="Source Name"),
 *     @OA\Property(property="category", type="string", example="Category Name"),
 *     @OA\Property(property="published_at", type="string", format="date-time", example="2024-10-11T12:34:56Z"),
 * )
 */
class ArticleController extends Controller
{
    /**
     * @OA\Get(
     *     path="/api/articles",
     *     tags={"Articles"},
     *     summary="Fetch articles with support for pagination and filtering",
     *     @OA\Parameter(
     *         name="keyword",
     *         in="query",
     *         description="Keyword to filter articles",
     *         required=false,
     *         @OA\Schema(type="string")
     *     ),
     *     @OA\Parameter(
     *         name="date",
     *         in="query",
     *         description="Date to filter articles",
     *         required=false,
     *         @OA\Schema(type="string", format="date")
     *     ),
     *     @OA\Parameter(
     *         name="category",
     *         in="query",
     *         description="Category to filter articles",
     *         required=false,
     *         @OA\Schema(type="string")
     *     ),
     *     @OA\Parameter(
     *         name="source",
     *         in="query",
     *         description="Source to filter articles",
     *         required=false,
     *         @OA\Schema(type="string")
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Successful retrieval of articles",
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="current_page", type="integer"),
     *             @OA\Property(property="data", type="array",
     *                 @OA\Items(ref="#/components/schemas/Article")
     *             ),
     *             @OA\Property(property="last_page", type="integer"),
     *             @OA\Property(property="total", type="integer")
     *         )
     *     ),
     *     @OA\Response(
     *         response=500,
     *         description="Failed to fetch articles",
     *         @OA\JsonContent(
     *             @OA\Property(property="error", type="string")
     *         )
     *     )
     * )
     */

    public function index(Request $request)
    {
        /*try {
            $cacheKey = 'articles_' . md5($request->fullUrl());

            $articles = Cache::remember($cacheKey, 60, function () use ($request) {
                return $this->filterArticles($request)->paginate(10);
            });

            return response()->json($articles);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to fetch articles'], 500);
        }*/

        try {
            $cacheKey = 'articles_' . md5($request->fullUrl());

            $articles = Cache::remember($cacheKey, 60, function () use ($request) {
                return $this->filterArticles($request)->paginate(10);
            });

            return ArticleResource::collection($articles);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to fetch articles'], 500);
        }
    }

    /**
     * Filter articles based on query parameters.
     *
     * @param Request $request
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function filterArticles(Request $request)
    {
        $query = Article::query();

        $this->applyFilters($query, $request);

        return $query;
    }

    /**
     * Apply filters to the articles query.
     *
     * @param \Illuminate\Database\Eloquent\Builder $query
     * @param Request $request
     * @return void
     */
    protected function applyFilters($query, Request $request)
    {
        if ($keyword = $request->get('keyword')) {
            $query->where(function ($q) use ($keyword) {
                $q->where('title', 'like', '%' . $keyword . '%')
                    ->orWhere('content', 'like', '%' . $keyword . '%');
            });
        }

        if ($date = $request->get('date')) {
            $query->whereDate('published_at', $date);
        }

        if ($category = $request->get('category')) {
            $query->where('category', $category);
        }

        if ($source = $request->get('source')) {
            $query->where('source', $source);
        }
    }

    /**
     * @OA\Get(
     *     path="/api/articles/{id}",
     *     tags={"Articles"},
     *     summary="Retrieve a single article's details",
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         required=true,
     *         description="ID of the article",
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Successful retrieval of article",
     *         @OA\JsonContent(ref="#/components/schemas/Article")
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Article not found",
     *         @OA\JsonContent(
     *             @OA\Property(property="message", type="string")
     *         )
     *     )
     * )
     */
    public function show($id)
    {
        if (!auth()->check()) {
            return response()->json(['message' => 'Unauthorized access. Please provide a valid token.'], 401);
        }

        try {
            $cacheKey = "article_{$id}";
            $article = Cache::remember($cacheKey, 60, function () use ($id) {
                return Article::findOrFail($id);
            });

            return response()->json($article);
        } catch (ModelNotFoundException $e) {
            return response()->json(['message' => 'Article not found'], 404);
        } catch (\Exception $e) {
            return response()->json(['message' => 'An unexpected error occurred: ' . $e->getMessage()], 500);
        }
    }

}
