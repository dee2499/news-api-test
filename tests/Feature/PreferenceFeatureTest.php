<?php

namespace Tests\Feature;

use App\Models\Article;
use App\Models\User;
use App\Models\Preference;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\Cache;
use Tests\TestCase;

class PreferenceFeatureTest extends TestCase
{
    use RefreshDatabase;

    private $user;

    protected function setUp(): void
    {
        parent::setUp();
        $this->user = User::factory()->create();
        $this->actingAs($this->user);
    }

    public function testSetUserPreferences()
    {
        $data = [
            'sources' => ['NewsAPI', 'The Guardian'],
            'categories' => ['sports', 'general'],
            'authors' => ['John Doe', 'Jane Smith'],
        ];

        $response = $this->postJson('/api/setPreferences', $data);

        $response->assertStatus(200)
            ->assertJson([
                'message' => 'Preferences saved successfully',
                'data' => [
                    'user_id' => $this->user->id,
                    'sources' => 'NewsAPI,The Guardian',
                    'categories' => 'sports,general',
                    'authors' => 'John Doe,Jane Smith',
                ],
            ]);
    }

    public function testGetUserPreferences()
    {
        Preference::create([
            'user_id' => $this->user->id,
            'sources' => '"NewsAPI,The Guardian"',
            'categories' => '"sports,general"',
            'authors' => '"John Doe,Jane Smith"',
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

    public function testGetUserPreferencesNotFound()
    {
        $response = $this->getJson('/api/getPreferences');

        $response->assertStatus(404)
            ->assertJson(['message' => 'Preferences not found']);
    }

    public function testGetPersonalizedFeed()
    {
        // Create preferences for the user
        Preference::create([
            'user_id' => $this->user->id,
            'sources' => 'NewsAPI',
            'categories' => 'sports',
            'authors' => 'John Doe',
        ]);

        // Create some articles for the test
        Article::create([
            'title' => 'Sports Article',
            'source' => 'NewsAPI',
            'category' => 'sports',
            'author' => 'John Doe',
            'content' => 'Content of the sports article.',
        ]);

        $response = $this->getJson('/api/personalized-feed');

        $response->assertStatus(200)
            ->assertJsonFragment(['title' => 'Sports Article']);
    }

    public function testGetPersonalizedFeedNotFound()
    {
        $response = $this->getJson('/api/personalized-feed');

        $response->assertStatus(404)
            ->assertJson(['message' => 'Preferences not found']);
    }
}
