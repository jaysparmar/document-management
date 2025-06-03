<?php

use Illuminate\Support\Facades\Broadcast;

/*
|--------------------------------------------------------------------------
| Broadcast Channels
|--------------------------------------------------------------------------
|
| Here you may register all of the event broadcasting channels that your
| application supports. The given channel authorization callbacks are
| used to check if an authenticated user can listen to the channel.
|
*/

Broadcast::channel('App.Models.Users.{id}', function ($user, $id) {
    return (int) $user->id === (int) $id;
});

Broadcast::channel('private-chatify.{id}', function ($user, $id) {
    return (int) $user->id === (int) $id;
});

Broadcast::channel('presence-activeStatus', function ($user) {
    // Log the user object for debugging
    \Illuminate\Support\Facades\Log::info('presence-activeStatus callback', [
        'user' => $user ? get_class($user) : 'null',
        'user_id' => $user ? ($user->id ?? 'not set') : 'null',
        'firstName' => $user ? ($user->firstName ?? 'not set') : 'null',
        'lastName' => $user ? ($user->lastName ?? 'not set') : 'null'
    ]);

    // Ensure the user object is valid
    if ($user && $user instanceof \App\Models\Users) {
        // Use the toPresenceData method to get the presence channel data
        return $user->toPresenceData();
    }

    // If the user is valid but not an instance of Users, try to create a presence data array
    if ($user && isset($user->id)) {
        // Get user properties safely with fallbacks
        $firstName = $user->firstName ?? 'Unknown';
        $lastName = $user->lastName ?? 'User';

        return [
            'id' => $user->id,
            'user_id' => $user->id,
            'name' => $firstName . ' ' . $lastName
        ];
    }

    // Return a default value if the user object is invalid
    \Illuminate\Support\Facades\Log::warning('Invalid user object for presence-activeStatus channel');
    return false;
});
