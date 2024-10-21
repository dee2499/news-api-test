<?php

namespace Tests\Unit;

use App\Http\Controllers\ArticleController;
use App\Models\Article;
use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Http\Request;
use Tests\TestCase;

class ArticleControllerTest extends TestCase
{
    use RefreshDatabase;

    protected function setUp(): void
    {
        parent::setUp();
    }

    public function testFilterArticlesByKeyword()
    {
        Article::create(['title' => 'First Article', 'content' => 'Content of the first article.', 'author' => 'Author A', 'source' => 'Source A', 'category' => 'Category A']);
        Article::create(['title' => 'Second Article', 'content' => 'Content of the second article.', 'author' => 'Author B', 'source' => 'Source B', 'category' => 'Category B']);

        $request = Request::create('/api/articles?keyword=First', 'GET');

        $controller = new ArticleController();
        $query = $controller->filterArticles($request);

        $this->assertCount(1, $query->get());
        $this->assertEquals('First Article', $query->first()->title);
    }

    public function testApplyFiltersByDate()
    {
        $article = Article::create([
            'title' => 'Date Filter Article',
            'content' => 'Some content.',
            'author' => 'Author',
            'source' => 'Source',
            'category' => 'Category',
            'published_at' => now()->subDays(1),
        ]);

        $request = Request::create('/api/articles?date=' . $article->published_at->toDateString(), 'GET');

        $controller = new ArticleController();
        $query = $controller->filterArticles($request);

        $this->assertCount(1, $query->get());
        $this->assertEquals($article->id, $query->first()->id);
    }

    public function testGetSingleArticle()
    {
        $user = User::factory()->create();
        $this->actingAs($user);


        $article = Article::factory()->create();


        $response = $this->getJson("/api/articles/{$article->id}");


        $response->assertStatus(200)
            ->assertJsonStructure([
                'id',
                'title',
                'content',
                'author',
                'source',
                'category',
                'published_at',
            ]);


        $this->assertEquals($article->title, $response->json('title'));
        $this->assertEquals($article->content, $response->json('content'));
    }
}
