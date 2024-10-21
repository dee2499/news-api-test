<?php

namespace App\Console\Commands;

use Carbon\Carbon;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Http;
use App\Models\Article;

class FetchNewsArticle extends Command
{
    protected $signature = 'fetch:articles';
    protected $description = 'Fetch articles from news APIs and store them in the database';

    protected $newsApis;

    public function handle()
    {
        $this->newsApis = [
            'https://newsapi.org/v2/top-headlines?country=us&apiKey=' . env('NEWS_API_KEY'),
            'https://content.guardianapis.com/search?api-key=' . env('GUARDIAN_API_KEY'),
            'https://api.nytimes.com/svc/topstories/v2/home.json?api-key=' . env('NYTIMES_API_KEY'),
        ];

        foreach ($this->newsApis as $apiUrl) {
            $this->fetchAndStoreArticles($apiUrl);
        }

        $this->info('Articles fetched successfully!');
    }

    /**
     * Fetch articles from the given API URL and store them in the database.
     *
     * @param string $apiUrl
     * @return void
     */
    protected function fetchAndStoreArticles(string $apiUrl): void
    {
        $response = Http::get($apiUrl);

        if ($response->successful()) {
            $articles = $this->extractArticles($response->json(), $apiUrl);
            $this->storeArticles($articles);
        } else {
            $this->error("Failed to fetch articles from {$apiUrl}");
        }
    }

    /**
     * Extract articles from API response data.
     *
     * @param array $data
     * @param string $apiUrl
     * @return array
     */
    protected function extractArticles(array $data, string $apiUrl): array
    {
        return match (true) {
        str_contains($apiUrl, 'newsapi.org') => $this->extractNewsApiArticles($data),
            str_contains($apiUrl, 'guardianapis.com') => $this->extractGuardianArticles($data),
            str_contains($apiUrl, 'nytimes.com') => $this->extractNYTimesArticles($data),
            default => []
        };
    }

    /**
     * Extract articles from News API response.
     *
     * @param array $data
     * @return array
     */
    protected function extractNewsApiArticles(array $data): array
    {
        $articles = [];
        foreach ($data['articles'] ?? [] as $article) {
            $articles[] = [
                'title' => $article['title'] ?? 'No title available',
                'content' => $article['content'] ?? 'No content available',
                'author' => $article['author'] ?? null,
                'source' => 'NewsAPI',
                'category' => $article['category'] ?? 'General',
                'published_at' => Carbon::parse($article['publishedAt'] ?? now())->toDateTimeString(),
            ];
        }
        return $articles;
    }

    /**
     * Extract articles from The Guardian API response.
     *
     * @param array $data
     * @return array
     */
    protected function extractGuardianArticles(array $data): array
    {
        $articles = [];
        foreach ($data['response']['results'] ?? [] as $article) {
            $articles[] = [
                'title' => $article['webTitle'] ?? 'No title available',
                'content' => $article['fields']['body'] ?? 'No content available',
                'author' => $article['byline'] ?? null,
                'source' => 'The Guardian',
                'category' => $article['sectionId'] ?? 'General',
                'published_at' => Carbon::parse($article['webPublicationDate'] ?? now())->toDateTimeString(),
            ];
        }
        return $articles;
    }

    /**
     * Extract articles from The New York Times API response.
     *
     * @param array $data
     * @return array
     */
    protected function extractNYTimesArticles(array $data): array
    {
        $articles = [];
        foreach ($data['results'] ?? [] as $article) {
            $articles[] = [
                'title' => $article['title'] ?? 'No title available',
                'content' => $article['abstract'] ?? 'No content available',
                'author' => $article['byline'] ?? null,
                'source' => 'The New York Times',
                'category' => $article['section'] ?? 'General',
                'published_at' => Carbon::parse($article['published_date'] ?? now())->toDateTimeString(),
            ];
        }
        return $articles;
    }

    /**
     * Store articles in the database.
     *
     * @param array $articles
     * @return void
     */
    protected function storeArticles(array $articles): void
    {
        foreach ($articles as $articleData) {
            Article::updateOrCreate(
                ['title' => $articleData['title']],
                $articleData
            );
        }
    }
}
