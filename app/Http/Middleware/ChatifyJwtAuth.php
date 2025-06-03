<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class ChatifyJwtAuth
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        // Log the request for debugging
        \Illuminate\Support\Facades\Log::info('ChatifyJwtAuth middleware', [
            'path' => $request->path(),
            'method' => $request->method(),
            'auth_header' => $request->header('Authorization')
        ]);

        // Check if user is authenticated via JWT
        if (!Auth::check()) {
            \Illuminate\Support\Facades\Log::warning('ChatifyJwtAuth: User not authenticated');
            return response()->json([
                'status' => 'error',
                'message' => 'Unauthorized',
            ], 401);
        }

        // Log the authenticated user for debugging
        \Illuminate\Support\Facades\Log::info('ChatifyJwtAuth: User authenticated', [
            'user_id' => Auth::id(),
            'user_email' => Auth::user()->email
        ]);

        return $next($request);
    }
}
