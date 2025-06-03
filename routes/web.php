<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Broadcast;
use App\Http\Controllers\AngularController;

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

// Route::get('/', function () {
//     return view('angular');
// });

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
        // Log the authenticated user for debugging
        \Illuminate\Support\Facades\Log::info('Authenticated user', [
            'user_id' => auth('api')->id(),
            'user_email' => auth('api')->user()->email
        ]);

        // Set the authenticated user in the request
        request()->setUserResolver(function () {
            return auth('api')->user();
        });

        try {
            $response = Broadcast::auth(request());
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

Route::any('/{any}', [AngularController::class, 'index'])
    ->where('any', '^(?!(api|install|update|chatify)).*$');
// Route::get('/category', [CategoryController::class, 'index']);
// Route::get('/category',function(){
// });
