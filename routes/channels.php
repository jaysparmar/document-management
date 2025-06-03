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
    // Ensure the user object is valid and has the required properties
    if ($user && isset($user->id) && isset($user->firstName) && isset($user->lastName)) {
        return [
            'id' => $user->id,
            'user_id' => $user->id,
            'name' => $user->firstName . ' ' . $user->lastName
        ];
    }

    // Return a default value if the user object is invalid
    return false;
});
