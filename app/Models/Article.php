<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @OA\Schema(
 *     schema="Article",
 *     type="object",
 *     @OA\Property(property="id", type="integer", description="The unique identifier of the article"),
 *     @OA\Property(property="title", type="string", description="The title of the article"),
 *     @OA\Property(property="content", type="string", description="The content of the article"),
 *     @OA\Property(property="author", type="string", description="The author of the article"),
 *     @OA\Property(property="source", type="string", description="The source of the article"),
 *     @OA\Property(property="category", type="string", description="The category of the article"),
 *     @OA\Property(property="published_at", type="string", format="date-time", description="The date and time the article was published"),
 *     @OA\Property(property="created_at", type="string", format="date-time", description="The date and time the article was created"),
 *     @OA\Property(property="updated_at", type="string", format="date-time", description="The date and time the article was last updated")
 * )
 */

class Article extends Model
{
    use HasFactory;

    protected $table = 'articles';

    protected $fillable = [
        'title',
        'content',
        'author',
        'source',
        'category',
        'published_at',
    ];
}
