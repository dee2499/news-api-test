<?php

namespace Tests\Unit;

use App\Models\Article;
use App\Models\User;
use App\Models\Preference;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Http\Request;
use Tests\TestCase;

class PreferenceControllerTest extends TestCase
{
    use RefreshDatabase;

    private function implodeArray($array)
    {
        return is_array($array) ? implode(',', $array) : $array;
    }

    protected function setUp(): void
    {
        parent::setUp();
        $this->user = User::factory()->create();
        $this->actingAs($this->user);
    }

    public function testSetUserPreference()
    {
        $data = [
            'sources' => ['NewsAPI', 'The Guardian'],
            'categories' => ['sports', 'general'],
            'authors' => ['John Doe', 'Jane Smith'],
        ];

        $this->postJson('/api/setPreferences', $data)
            ->assertStatus(200)
            ->assertJson(['message' => 'Preferences saved successfully']);

        $this->assertDatabaseHas('preferences', [
            'user_id' => $this->user->id,
            'sources' => '"NewsAPI,The Guardian"',
            'categories' => '"sports,general"',
            'authors' => '"John Doe,Jane Smith"',
        ]);
    }

    public function testGetUserPreference()
    {
        Preference::create([
            'user_id' => $this->user->id,
            'sources' => 'NewsAPI,The Guardian',
            'categories' => 'sports,general',
            'authors' => 'John Doe,Jane Smith',
        ]);

        $response = $this->getJson('/api/getPreferences');

        $response->assertStatus(200)
            ->assertJsonStructure([
                'id',
                'user_id',
                'sources',
                'categories',
                'authors',
                'created_at',
                'updated_at',
            ]);
    }

    public function testPersonalizedFeed()
    {
        Preference::create([
            'user_id' => $this->user->id,
            'sources' => 'NewsAPI',
            'categories' => 'sports',
            'authors' => 'John Doe',
        ]);

        // Create some articles for the test
        $article1 = Article::create([
            'title' => 'Sports News',
            'source' => 'NewsAPI',
            'category' => 'sports',
            'author' => 'John Doe',
            'content' => 'Content of the sports news article.',
        ]);

        $response = $this->getJson('/api/personalized-feed');

        $response->assertStatus(200)
            ->assertJsonFragment([
                'title' => 'Sports News',
            ]);
    }
}
