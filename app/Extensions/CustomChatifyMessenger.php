<?php

namespace App\Extensions;

use Chatify\ChatifyMessenger;
use Illuminate\Support\Facades\Log;

class CustomChatifyMessenger extends ChatifyMessenger
{
    /**
     * Authentication for pusher - overridden to be less restrictive
     *
     * @param User $requestUser
     * @param User $authUser
     * @param string $channelName
     * @param string $socket_id
     * @return mixed
     */
    public function pusherAuth($requestUser, $authUser, $channelName, $socket_id)
    {
        // Log the authentication attempt for debugging
        Log::info('CustomChatifyMessenger::pusherAuth', [
            'requestUser' => $requestUser ? $requestUser->id : 'null',
            'authUser' => $authUser ? $authUser->id : 'null',
            'channelName' => $channelName,
            'socket_id' => $socket_id
        ]);

        // Check if user is authenticated
        if (!$authUser) {
            Log::warning('Pusher auth failed: No auth user');
            return response()->json(['message' => 'Not authenticated'], 403);
        }

        // Prepare auth data
        $authData = json_encode([
            'user_id' => $authUser->id,
            'user_info' => [
                'name' => $authUser->name ?? ($authUser->firstName . ' ' . $authUser->lastName)
            ]
        ]);

        // For presence channels
        if (strpos($channelName, 'presence-') === 0) {
            Log::info('Authenticating for presence channel', ['channel' => $channelName]);
            return $this->pusher->presence_auth(
                $channelName,
                $socket_id,
                $authUser->id,
                ['user_info' => true]
            );
        }

        // For private channels - allow authentication for all private channels
        if (strpos($channelName, 'private-') === 0) {
            Log::info('Authenticating for private channel', ['channel' => $channelName]);
            return $this->pusher->socket_auth(
                $channelName,
                $socket_id,
                $authData
            );
        }

        // For public channels - no authentication needed
        Log::info('No authentication needed for public channel', ['channel' => $channelName]);
        return response()->json(['success' => true]);
    }
}
