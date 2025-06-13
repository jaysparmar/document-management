<?php

namespace App\Http\Controllers;



use App\Models\ChMessage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use App\Models\Users;
use App\Models\Clients;

class ChatifyApiController extends Controller
{
    /**
     * Get all contacts except the current user.
     */
    public function getContacts(Request $request)
    {
        // Get users
        $users = Users::where('id', '!=', Auth::id())->get()->map(function ($user) {
            return [
                'id' => $user->id,
                'name' => $user->firstName . ' ' . $user->lastName,
                'avatar' => null, // TODO: Add avatar URL logic
                'email' => $user->email,
                'type' => 'user',
            ];
        });

        // Get clients
        $clients = Clients::all()->map(function ($client) {
            return [
                'id' => $client->id,
                'name' => $client->companyName . ' (' . $client->contactPerson . ')',
                'avatar' => null,
                'email' => $client->email,
                'type' => 'client',
            ];
        });

        // Combine users and clients
        $contacts = $users->concat($clients);

        return response()->json($contacts);
    }

    /**
     * Fetch messages between authenticated user and the given user ID.
     */
    public function fetchMessages(Request $request)
    {
        $userId = $request->input('id');
        $userType = $request->input('type', 'user'); // Default to 'user' if not provided
        $authId = Auth::id();
        $authType = 'user'; // Current authenticated user is always a user

        $messages = ChMessage::where(function ($q) use ($authId, $userId, $authType, $userType) {
            $q->where('from_id', $authId)
              ->where('from_type', $authType)
              ->where('to_id', $userId)
              ->where('to_type', $userType);
        })->orWhere(function ($q) use ($authId, $userId, $authType, $userType) {
            $q->where('from_id', $userId)
              ->where('from_type', $userType)
              ->where('to_id', $authId)
              ->where('to_type', $authType);
        })->orderBy('created_at', 'asc')->get();

        // Add isMine flag to each message to help frontend determine message position
        $messages = $messages->map(function ($message) use ($authId, $authType) {
            $message->isMine = $message->from_id === $authId && $message->from_type === $authType;
            return $message;
        });

        // Mark messages from the other user as read
        $this->markMessagesAsRead($authId, $authType, $userId, $userType);

        return response()->json([
            'messages' => $messages,
        ]);
    }

    /**
     * Fetch only new messages since a given timestamp.
     */
    public function fetchNewMessages(Request $request)
    {
        $userId = $request->input('id');
        $userType = $request->input('type', 'user'); // Default to 'user' if not provided
        $since = $request->input('since'); // Timestamp of the last message received
        $authId = Auth::id();
        $authType = 'user'; // Current authenticated user is always a user
//        dd("asd");
        $query = ChMessage::where(function ($q) use ($authId, $userId, $authType, $userType) {
            $q->where(function ($q2) use ($authId, $userId, $authType, $userType) {
                $q2->where('from_id', $authId)
                    ->where('from_type', $authType)
                    ->where('to_id', $userId)
                    ->where('to_type', $userType)
                    ->whereNull('read_at');
            })->orWhere(function ($q2) use ($authId, $userId, $authType, $userType) {
                $q2->where('from_id', $userId)
                    ->where('from_type', $userType)
                    ->where('to_id', $authId)
                    ->where('to_type', $authType)
                    ->whereNull('read_at');
            });
        });


        // If since parameter is provided, only get messages after that timestamp
        if ($since) {
            $query->where('created_at', '>', $since);
        }

        $messages = $query->orderBy('created_at', 'asc')->get();

        // Add isMine flag to each message
        $messages = $messages->map(function ($message) use ($authId, $authType) {
            $message->isMine = $message->from_id === $authId && $message->from_type === $authType;
            return $message;
        });

        // Mark messages from the other user as read
//        $this->markMessagesAsRead($authId, $authType, $userId, $userType);

        // Count unread messages (messages to the authenticated user that haven't been read)
        $unreadCount = ChMessage::where('to_id', $authId)
            ->where('to_type', $authType)
            ->whereNull('read_at')
            ->count();

        return response()->json([
            'messages' => $messages,
            'unread_count' => $unreadCount,
        ]);
    }

    /**
     * Get count of unread messages for the authenticated user.
     */
    public function getUnreadCount(Request $request)
    {
        $authId = Auth::id();
        $authType = 'user'; // Current authenticated user is always a user

        // Count unread messages (messages to the authenticated user that haven't been read)
        $unreadCount = ChMessage::where('to_id', $authId)
            ->where('to_type', $authType)
            ->whereNull('read_at')
            ->count();

        return response()->json([
            'unread_count' => $unreadCount
        ]);
    }

    /**
     * Mark messages as read.
     */
    private function markMessagesAsRead($toId, $toType, $fromId, $fromType)
    {
        // Mark all messages from the other user to the authenticated user as read
        ChMessage::where('from_id', $fromId)
            ->where('from_type', $fromType)
            ->where('to_id', $toId)
            ->where('to_type', $toType)
            ->whereNull('read_at')
            ->update(['read_at' => now()]);
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

        $authId = Auth::id();
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
        $message->from_id = $authId;
        $message->from_type = 'user'; // Current authenticated user is always a user
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
     * Mark a user as favorite (placeholder for now).
     */
    public function makeFavorite(Request $request)
    {
        $request->validate([
            'user_id' => 'required|exists:users,id',
        ]);

        // TODO: Save to favorite table if needed

        return response()->json([
            'status' => 'success',
            'message' => 'User marked as favorite.',
        ]);
    }

    /**
     * Get shared photos between the authenticated user and another user.
     */
    public function getSharedPhotos(Request $request)
    {
        $request->validate([
            'user_id' => 'required|exists:users,id',
        ]);

        $userId = $request->input('user_id');
        $authId = Auth::id();

        $messagesWithFiles = ChMessage::where(function ($q) use ($authId, $userId) {
            $q->where('from_id', $authId)->where('to_id', $userId);
        })->orWhere(function ($q) use ($authId, $userId) {
            $q->where('from_id', $userId)->where('to_id', $authId);
        })->whereNotNull('attachment')->get();

        $shared = $messagesWithFiles->map(function ($msg) {
            return [
                'name' => $msg->attachment,
                'url' => url(Storage::url('chatify/attachments/' . $msg->attachment)),
            ];
        });

        return response()->json([
            'shared' => $shared,
        ]);
    }

    /**
     * Search users by name or email.
     */
    public function searchUsers(Request $request)
    {
        $query = $request->input('input');

        // Search users
        $users = Users::where('id', '!=', Auth::id())
            ->where(function ($q) use ($query) {
                $q->where('firstName', 'LIKE', "%{$query}%")
                    ->orWhere('lastName', 'LIKE', "%{$query}%")
                    ->orWhere('email', 'LIKE', "%{$query}%");
            })->get()->map(function ($user) {
                return [
                    'id' => $user->id,
                    'name' => $user->firstName . ' ' . $user->lastName,
                    'avatar' => null, // TODO: Add avatar URL logic
                    'email' => $user->email,
                    'type' => 'user',
                ];
            });

        // Search clients
        $clients = Clients::where(function ($q) use ($query) {
                $q->where('companyName', 'LIKE', "%{$query}%")
                    ->orWhere('contactPerson', 'LIKE', "%{$query}%")
                    ->orWhere('email', 'LIKE', "%{$query}%");
            })->get()->map(function ($client) {
                return [
                    'id' => $client->id,
                    'name' => $client->companyName . ' (' . $client->contactPerson . ')',
                    'avatar' => null,
                    'email' => $client->email,
                    'type' => 'client',
                ];
            });

        // Combine users and clients
        $contacts = $users->concat($clients);

        return response()->json($contacts);
    }
}
