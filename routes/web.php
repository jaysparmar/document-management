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

Route::prefix('client-portal')->group(function () {
    Route::get('/login', function () {
        return view('client.auth.login');
    })->name('client-portal.login');
    Route::get('/', function () {
        return view('client.dashboard');
    })->name('client-portal.home');
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

Route::any('/{any}', [AngularController::class, 'index'])
    ->where('any', '^(?!(api|install|update|chatify)).*$');
// Route::get('/category', [CategoryController::class, 'index']);
// Route::get('/category',function(){
// });
