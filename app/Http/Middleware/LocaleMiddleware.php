<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;

class LocaleMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        if (session()->has('locale')) {
            App::setLocale(session()->get('locale'));
        } else {
            $preferredLanguage = substr($request->server('HTTP_ACCEPT_LANGUAGE'), 0, 2);
            if (in_array($preferredLanguage, ['en', 'fr'])) {
                session()->put('locale', $preferredLanguage);
                App::setLocale($preferredLanguage);
            }
        }
        
        return $next($request);
    }
}
