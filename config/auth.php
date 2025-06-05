<?php

return [

    'defaults' => [
        'guard' => env('AUTH_GUARD', 'api'),
        'passwords' => 'users',
    ],

    'guards' => [
        'api' => [
            'driver' => 'jwt',
            'provider' => 'users'
        ],
        'client' => [
            'driver' => 'session', // or 'session' if you want session-based auth
            'provider' => 'clients'
        ],
    ],

    'providers' => [
        'users' => [
            'driver' => 'eloquent',
            'model'  =>  App\Models\Users::class,
        ],
        'clients' => [
            'driver' => 'eloquent',
            'model'  =>  App\Models\Clients::class,
        ]
    ],

];
