<?php

namespace App\Http\Resources;

use Carbon\Carbon;
use Illuminate\Http\Resources\Json\JsonResource;

class ArticleResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'title' => $this->title,
            'content' => $this->content,
            'author' => $this->author,
            'source' => $this->source,
            'category' => $this->category,
            'published_at' => $this->formatPublishedAt($this->published_at),
        ];
    }

    /**
     * Format the published_at field to a date-time string.
     *
     * @param string|null $publishedAt
     * @return string|null
     */
    private function formatPublishedAt($publishedAt)
    {
        if ($publishedAt) {
            return Carbon::parse($publishedAt)->toDateTimeString();
        }

        return null;
    }
}
