<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @OA\Schema(
 *     schema="Preference",
 *     type="object",
 *     @OA\Property(property="id", type="integer", description="The unique identifier of the preference"),
 *     @OA\Property(property="user_id", type="integer", description="The ID of the user associated with the preference"),
 *     @OA\Property(property="sources", type="array", @OA\Items(type="string"), description="Preferred news sources"),
 *     @OA\Property(property="categories", type="array", @OA\Items(type="string"), description="Preferred news categories"),
 *     @OA\Property(property="authors", type="array", @OA\Items(type="string"), description="Preferred news authors"),
 *     @OA\Property(property="created_at", type="string", format="date-time", description="The date and time the preference was created"),
 *     @OA\Property(property="updated_at", type="string", format="date-time", description="The date and time the preference was last updated")
 * )
 */
class Preference extends Model
{
    use HasFactory;

    protected $table = 'preferences';

    protected $fillable = [
        'user_id',
        'sources',
        'categories',
        'authors',
    ];

    protected $casts = [
        'sources' => 'array',
        'categories' => 'array',
        'authors' => 'array',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
