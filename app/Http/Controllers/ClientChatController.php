<?php

namespace App\Http\Controllers;

use App\Models\ChMessage;
use App\Models\Clients;
use App\Models\Users;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class ClientChatController extends Controller
{
    /**
     * Get all contacts for the client.
     */
    public function getContacts(Request $request)
    {
        // Get the authenticated client
        $client = Auth::guard('client')->user();

        if (!$client) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        // Get users (admin users)
        $users = Users::all()->map(function ($user) {
            return [
                'id' => $user->id,
                'name' => $user->firstName . ' ' . $user->lastName,
                'avatar' => null,
                'active_status' => true, // TODO: Add real-time online check
                'email' => $user->email,
                'type' => 'user',
            ];
        });

        return response()->json($users);
    }

    /**
     * Fetch messages between authenticated client and the given user ID.
     */
    public function fetchMessages(Request $request)
    {
        $userId = $request->input('id');
        $userType = $request->input('type', 'user');

        // Get the authenticated client
        $client = Auth::guard('client')->user();

        if (!$client) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        $clientId = $client->id;
        $clientType = 'client';

        $messages = ChMessage::where(function ($q) use ($clientId, $userId, $clientType, $userType) {
            $q->where('from_id', $clientId)
              ->where('from_type', $clientType)
              ->where('to_id', $userId)
              ->where('to_type', $userType);
        })->orWhere(function ($q) use ($clientId, $userId, $clientType, $userType) {
            $q->where('from_id', $userId)
              ->where('from_type', $userType)
              ->where('to_id', $clientId)
              ->where('to_type', $clientType);
        })->orderBy('created_at', 'asc')->get();

        // Add isMine flag to each message to help frontend determine message position
        $messages = $messages->map(function ($message) use ($clientId, $clientType) {
            $message->isMine = $message->from_id === $clientId && $message->from_type === $clientType;
            return $message;
        });

        return response()->json([
            'messages' => $messages,
        ]);
    }

    /**
     * Send a message with optional file attachment.
     */
    public function sendMessage(Request $request)
    {
        $request->validate([
            'message' => 'nullable|string',
            'id' => 'required',
            'type' => 'required|in:user,client',
            'file' => 'nullable|file|max:10240', // max 10MB
        ]);

        // Get the authenticated client
        $client = Auth::guard('client')->user();

        if (!$client) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        $fromId = $client->id;
        $fromType = 'client';
        $toId = $request->input('id');
        $toType = $request->input('type');
        $messageText = $request->input('message');
        $attachment = $request->file('file');

        // Validate that the recipient exists based on type
        if ($toType === 'user') {
            $exists = Users::where('id', $toId)->exists();
        } else {
            $exists = Clients::where('id', $toId)->exists();
        }

        if (!$exists) {
            return response()->json([
                'status' => 'error',
                'message' => 'Recipient not found',
            ], 404);
        }

        $message = new ChMessage();
        $message->id = Str::uuid();
        $message->body = $messageText ?? '';
        $message->from_id = $fromId;
        $message->from_type = $fromType;
        $message->to_id = $toId;
        $message->to_type = $toType;

        if ($attachment) {
            $fileName = uniqid() . '_' . $attachment->getClientOriginalName();
            $path = $attachment->storeAs('chatify/attachments', $fileName, 'public');
            $message->attachment = $fileName;
            // Ensure consistent URL format with getSharedPhotos method
            $message->attachment_url = url(Storage::url('chatify/attachments/' . $fileName));
        }

        $message->save();

        return response()->json([
            'status' => 'success',
            'message' => $message,
        ]);
    }

    /**
     * Search users by name or email.
     */
    public function searchUsers(Request $request)
    {
        $query = $request->input('input');

        // Get the authenticated client
        $client = Auth::guard('client')->user();

        if (!$client) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        // Search users
        $users = Users::where(function ($q) use ($query) {
                $q->where('firstName', 'LIKE', "%{$query}%")
                    ->orWhere('lastName', 'LIKE', "%{$query}%")
                    ->orWhere('email', 'LIKE', "%{$query}%");
            })->get()->map(function ($user) {
                return [
                    'id' => $user->id,
                    'name' => $user->firstName . ' ' . $user->lastName,
                    'avatar' => null,
                    'active_status' => true,
                    'email' => $user->email,
                    'type' => 'user',
                ];
            });

        return response()->json($users);
    }
}
