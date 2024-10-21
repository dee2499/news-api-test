<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Article;

class ArticleSeeder extends Seeder
{
    public function run()
    {
        Article::create([
            'title' => 'Breaking News: Example Headline',
            'content' => 'Content of the article goes here...',
            'source' => 'NewsAPI',
            'category' => 'general',
            'author' => 'Jane Smith',
        ]);
    }
}