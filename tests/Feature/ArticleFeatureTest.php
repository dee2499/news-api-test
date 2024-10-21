<?php

namespace Tests\Feature;

use App\Models\Article;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class ArticleFeatureTest extends TestCase
{
    use RefreshDatabase;

    protected function setUp(): void
    {
        parent::setUp();
    }

    public function testFetchArticles()
    {
        $user = User::factory()->create();
        $this->actingAs($user);

        Article::factory()->create(['title' => 'First Article', 'content' => 'Content of the first article.', 'author' => 'Author A', 'source' => 'Source A', 'category' => 'Category A']);
        Article::factory()->create(['title' => 'Second Article', 'content' => 'Content of the second article.', 'author' => 'Author B', 'source' => 'Source B', 'category' => 'Category B']);

        $response = $this->getJson('/api/articles');

        $response->assertStatus(200)
            ->assertJsonStructure([
                'current_page',
                'data' => [
                    '*' => [
                        'id',
                        'title',
                        'content',
                        'author',
                        'source',
                        'category',
                        'published_at',
                    ]
                ],
                'last_page',
                'total',
            ]);
    }

    public function testFetchSingleArticle()
    {
        $user = User::factory()->create();
        $this->actingAs($user);

        $article = Article::factory()->create(['title' => 'Single Article', 'content' => 'Content.', 'author' => 'Author', 'source' => 'Source', 'category' => 'Category']);

        $response = $this->getJson('/api/articles/' . $article->id);

        $response->assertStatus(200)
            ->assertJson([
                'id' => $article->id,
                'title' => $article->title,
                'content' => $article->content,
                'author' => $article->author,
                'source' => $article->source,
                'category' => $article->category,
            ]);
    }

    public function testFetchSingleArticleNotFound()
    {
        $user = User::factory()->create();
        $this->actingAs($user);

        $response = $this->getJson('/api/articles/999');

        $response->assertStatus(404)
            ->assertJson([
                'message' => 'Article not found',
            ]);
    }

    public function testFetchArticlesWithFilters()
    {
        $user = User::factory()->create(); // Create a new user
        $this->actingAs($user); // Authenticate the user

        Article::create(['title' => 'Filtered Article', 'content' => 'Content A.', 'author' => 'Author A', 'source' => 'Source A', 'category' => 'Category A', 'published_at' => now()]);
        Article::create(['title' => 'Another Article', 'content' => 'Content B.', 'author' => 'Author B', 'source' => 'Source B', 'category' => 'Category B', 'published_at' => now()]);

        $response = $this->getJson('/api/articles?keyword=Filtered');

        $response->assertStatus(200)
            ->assertJsonCount(1, 'data')
            ->assertJsonFragment(['title' => 'Filtered Article']);
    }
}
