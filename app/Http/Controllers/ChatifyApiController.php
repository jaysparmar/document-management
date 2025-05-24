<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;

class ChatifyApiController extends Controller
{
    /**
     * Get contacts (users)
     */
    public function getContacts(Request $request)
    {
        $users = User::where('id', '!=', Auth::user()->id)
            ->get()
            ->map(function($user) {
                return [
                    'id' => $user->id,
                    'name' => $user->firstName . ' ' . $user->lastName,
                    'avatar' => null, // You can add avatar logic here
                    'active_status' => true, // You can add online status logic here
                    'email' => $user->email
                ];
            });

        return response()->json($users);
    }

    /**
     * Fetch messages for a specific user
     */
    public function fetchMessages(Request $request)
    {
        $userId = $request->input('id');

        // This is a placeholder. In a real implementation, you would fetch messages from your database
        // For now, we'll return an empty array
        return response()->json([
            'messages' => []
        ]);
    }

    /**
     * Send a message to a user
     */
    public function sendMessage(Request $request)
    {
        $message = $request->input('message');
        $userId = $request->input('id');
        $attachment = $request->file('file');

        $messageData = [
            'id' => Str::uuid()->toString(),
            'body' => $message,
            'from_id' => Auth::user()->id,
            'to_id' => $userId,
            'created_at' => now()
        ];

        if ($attachment) {
            $fileName = $attachment->getClientOriginalName();
            $path = $attachment->storeAs('chatify/attachments', $fileName, 'public');

            $messageData['attachment'] = [
                'name' => $fileName,
                'url' => Storage::url($path)
            ];
        }

        // This is a placeholder. In a real implementation, you would save the message to your database

        return response()->json([
            'status' => 'success',
            'message' => $messageData
        ]);
    }

    /**
     * Make a user favorite
     */
    public function makeFavorite(Request $request)
    {
        $userId = $request->input('user_id');

        // This is a placeholder. In a real implementation, you would update the favorite status in your database

        return response()->json([
            'status' => 'success'
        ]);
    }

    /**
     * Get shared photos between users
     */
    public function getSharedPhotos(Request $request)
    {
        $userId = $request->input('user_id');

        // This is a placeholder. In a real implementation, you would fetch shared photos from your database

        return response()->json([
            'shared' => []
        ]);
    }

    /**
     * Search for users
     */
    public function searchUsers(Request $request)
    {
        $query = $request->input('input');

        $users = User::where('id', '!=', Auth::user()->id)
            ->where(function($q) use ($query) {
                $q->where('firstName', 'LIKE', "%{$query}%")
                  ->orWhere('lastName', 'LIKE', "%{$query}%")
                  ->orWhere('email', 'LIKE', "%{$query}%");
            })
            ->get()
            ->map(function($user) {
                return [
                    'id' => $user->id,
                    'name' => $user->firstName . ' ' . $user->lastName,
                    'avatar' => null, // You can add avatar logic here
                    'active_status' => true, // You can add online status logic here
                    'email' => $user->email
                ];
            });

        return response()->json($users);
    }
}
