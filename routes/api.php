<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ArticleController;
use \App\Http\Controllers\PreferenceController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
Route::post('/logout', [AuthController::class, 'logout'])->middleware('auth:sanctum');
Route::post('/password/reset', [AuthController::class, 'resetPassword']);


Route::middleware(['auth:sanctum', 'throttle:5,1'])->group(function () {
    Route::get('/articles', [ArticleController::class, 'index']);
    Route::get('/articles/{id}', [ArticleController::class, 'show']);
});


Route::middleware(['auth:sanctum', 'throttle:5,1'])->group(function () {
    Route::post('/setPreferences', [PreferenceController::class, 'setPreferences']);
    Route::get('/getPreferences', [PreferenceController::class, 'getPreferences']);
    Route::get('/personalized-feed', [PreferenceController::class, 'personalizedFeed']);
});