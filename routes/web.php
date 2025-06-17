<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Broadcast;
use Illuminate\Support\Facades\Artisan;
use App\Http\Controllers\AngularController;
use App\Http\Controllers\Client\AuthController;
use App\Http\Controllers\Client\HomeController;
use App\Http\Controllers\Client\ProfileController;
use App\Http\Controllers\Client\DocumentController;
use App\Http\Controllers\LanguageController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Language Switch Route
Route::get('language/{locale}', [LanguageController::class, 'switchLang'])
    ->name('language.switch')
    ->where(['locale' => 'en|fr']);

// Route::get('/', function () {
//     return view('angular');
// });

// ✅ Allow access to login page without auth
Route::prefix('client-portal')->group(function () {
    Route::get('/login', function () {
        return view('client.auth.login');
    })->name('client-portal.login');
    Route::post('/authenticate', [AuthController::class, 'authenticate'])->name('client-portal.authenticate');
    Route::post('/logout', [App\Http\Controllers\Client\AuthController::class, 'logout'])
        ->name('logout')
        ->middleware('auth:client');
});

// ✅ Protect only authenticated client routes
Route::prefix('client-portal')->name('client-portal.')->middleware(['auth:client'])->group(function () {

    Route::get('/', [HomeController::class, 'index'])->name('home');
    Route::resource('documents', DocumentController::class);
    Route::get('profile', [ProfileController::class, 'index'])->name('profile.index');
    Route::get('profile/edit', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::put('profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::post('profile/change-password', [ProfileController::class, 'changePassword'])->name('profile.change-password');
    Route::get('profile/stats', [ProfileController::class, 'getStats'])->name('profile.stats');
    Route::get('/logout', [AuthController::class, 'logout'])->name('logout');
    Route::post('documents/view-document', [DocumentController::class, 'viewDocument'])->name('documents.view');

    // Meeting routes
    Route::get('meetings', [App\Http\Controllers\Client\MeetingController::class, 'index'])->name('meetings.index');
    Route::get('meetings/{id}', [App\Http\Controllers\Client\MeetingController::class, 'show'])->name('meetings.show');
    Route::post('meetings/{id}/accept', [App\Http\Controllers\Client\MeetingController::class, 'accept'])->name('meetings.accept');
    Route::get('meetings/{id}/join', [App\Http\Controllers\Client\MeetingController::class, 'join'])->name('meetings.join');
    Route::get('meetings/{id}/jitsi', [App\Http\Controllers\Client\MeetingController::class, 'getJitsiInfo'])->name('meetings.jitsi');

    // Client Chat Routes
    Route::prefix('chat')->group(function () {
        Route::get('/contacts', [App\Http\Controllers\ClientChatController::class, 'getContacts'])->name('chat.contacts');
        Route::post('/messages', [App\Http\Controllers\ClientChatController::class, 'fetchMessages'])->name('chat.messages');
        Route::post('/new-messages', [App\Http\Controllers\ClientChatController::class, 'fetchNewMessages'])->name('chat.new-messages');
        Route::get('/unread-count', [App\Http\Controllers\ClientChatController::class, 'getUnreadCount'])->name('chat.unread-count');
        Route::post('/send', [App\Http\Controllers\ClientChatController::class, 'sendMessage'])->name('chat.send');
        Route::post('/search', [App\Http\Controllers\ClientChatController::class, 'searchUsers'])->name('chat.search');
    });

    // routes/web.php or routes/client.php
    Route::get('documents/stream/{uuid}', [DocumentController::class, 'streamDocument'])
        ->name('documents.stream');
});


// Custom route for Pusher authentication
Route::match(['get', 'post'], '/chatify/auth', function () {
    // Log the request for debugging
    \Illuminate\Support\Facades\Log::info('Chatify auth request', [
        'socket_id' => request()->input('socket_id'),
        'channel_name' => request()->input('channel_name'),
        'auth_header' => request()->header('Authorization')
    ]);

    // Ensure the request is authenticated with the API guard
    if (auth('api')->check()) {
        $user = auth('api')->user();

        // Log the authenticated user for debugging
        \Illuminate\Support\Facades\Log::info('Authenticated user', [
            'user_id' => $user->id,
            'user_email' => $user->email,
            'user_class' => get_class($user),
            'user_properties' => [
                'firstName' => $user->firstName ?? 'not set',
                'lastName' => $user->lastName ?? 'not set'
            ]
        ]);

        // Set the authenticated user in the request and the Auth facade
        request()->setUserResolver(function () use ($user) {
            return $user;
        });

        // Set the default guard to 'api' for this request
        \Illuminate\Support\Facades\Auth::shouldUse('api');

        try {
            // Create a new request with the user already resolved
            $request = request();
            $request->setUserResolver(function () use ($user) {
                return $user;
            });

            // Call the Broadcast::auth method with the modified request
            $response = Broadcast::auth($request);

            \Illuminate\Support\Facades\Log::info('Broadcast auth response', [
                'response' => $response
            ]);

            return $response;
        } catch (\Exception $e) {
            \Illuminate\Support\Facades\Log::error('Broadcast auth error', [
                'message' => $e->getMessage(),
                'trace' => $e->getTraceAsString()
            ]);
            return response()->json(['message' => $e->getMessage()], 500);
        }
    }

    \Illuminate\Support\Facades\Log::warning('Unauthorized chatify auth request');
    return response()->json(['message' => 'Unauthorized'], 403);
})
    ->middleware(['auth.jwt'])
    ->withoutMiddleware([\Illuminate\Foundation\Http\Middleware\VerifyCsrfToken::class]);

// Test routes for Pusher
Route::get('/test-pusher', function () {
    event(new \App\Events\PusherTestEvent('Test message from Laravel at ' . now()));
    return 'Event dispatched! Check your browser console.';
});

Route::get('/pusher-test', function () {
    return view('pusher-test');
});

// Route to delete existing storage link and create a new one
Route::get('/storage-link', function () {
    try {
        // Delete existing storage link if it exists
        $publicStoragePath = public_path('storage');
        if (file_exists($publicStoragePath)) {
            if (is_link($publicStoragePath)) {
                unlink($publicStoragePath);
            } else {
                // If it's a directory and not a symlink, remove it recursively
                \Illuminate\Support\Facades\File::deleteDirectory($publicStoragePath);
            }
        }

        // Create new storage link
        Artisan::call('storage:link');
        return response()->json(['message' => 'Existing storage link deleted and new one created successfully.']);
    } catch (\Exception $e) {
        return response()->json(['error' => $e->getMessage()], 500);
    }
});

// Language Switch Route
Route::get('language/{locale}', [LanguageController::class, 'switchLang'])->name('language.switch');

// Client Portal Routes
Route::prefix('client-portal')->name('client-portal.')->group(function () {
    // ...existing code...
});
Route::any('/{any}', [AngularController::class, 'index'])
    ->where('any', '^(?!(api|install|update|chatify|storage|public|client-portal)).*$');

// Route::get('/category', [CategoryController::class, 'index']);
// Route::get('/category',function(){
// });
