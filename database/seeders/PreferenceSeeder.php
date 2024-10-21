<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Preference;
use App\Models\User;

class PreferenceSeeder extends Seeder
{
    public function run()
    {
        $user = User::first();

        Preference::create([
            'user_id' => $user->id,
            'sources' => 'NewsAPI,The Guardian',
            'categories' => 'sports,general',
            'authors' => 'John Doe,Jane Smith',
        ]);
    }
}