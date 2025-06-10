<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ChatifyApiController;

Route::group(['prefix' => 'chatify', 'middleware' => ['auth.jwt']], function () {
    Route::get('getContacts', [ChatifyApiController::class, 'getContacts']);
    Route::post('fetchMessages', [ChatifyApiController::class, 'fetchMessages']);
    Route::post('fetchNewMessages', [ChatifyApiController::class, 'fetchNewMessages']);
    Route::get('getUnreadCount', [ChatifyApiController::class, 'getUnreadCount']);
    Route::post('sendMessage', [ChatifyApiController::class, 'sendMessage']);
    Route::post('favorite', [ChatifyApiController::class, 'makeFavorite']);
    Route::post('shared/photos', [ChatifyApiController::class, 'getSharedPhotos']);
    Route::post('search', [ChatifyApiController::class, 'searchUsers']);
});
