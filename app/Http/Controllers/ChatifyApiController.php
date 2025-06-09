<?php

namespace App\Http\Controllers;



use App\Models\ChMessage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use App\Models\Users;

class ChatifyApiController extends Controller
{
    /**
     * Get all contacts except the current user.
     */
    public function getContacts(Request $request)
    {

        $users = Users::where('id', '!=', Auth::id())->get()->map(function ($user) {
            return [
                'id' => $user->id,
                'name' => $user->firstName . ' ' . $user->lastName,
                'avatar' => null, // TODO: Add avatar URL logic
                'active_status' => true, // TODO: Add real-time online check
                'email' => $user->email,
            ];
        });

        return response()->json($users);
    }

    /**
     * Fetch messages between authenticated user and the given user ID.
     */
    public function fetchMessages(Request $request)
    {
        $userId = $request->input('id');
        $authId = Auth::id();

        $messages = ChMessage::where(function ($q) use ($authId, $userId) {
            $q->where('from_id', $authId)->where('to_id', $userId);
        })->orWhere(function ($q) use ($authId, $userId) {
            $q->where('from_id', $userId)->where('to_id', $authId);
        })->orderBy('created_at', 'asc')->get();

        // Add isMine flag to each message to help frontend determine message position
        $messages = $messages->map(function ($message) use ($authId) {
            $message->isMine = $message->from_id === $authId;
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
            'id' => 'required|exists:users,id',
            'file' => 'nullable|file|max:10240', // max 10MB
        ]);

        $authId = Auth::id();
        $toId = $request->input('id');
        $messageText = $request->input('message');
        $attachment = $request->file('file');

        $message = new ChMessage();
        $message->id = Str::uuid();
        $message->body = $messageText ?? '';
        $message->from_id = $authId;
        $message->to_id = $toId;

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
                    'active_status' => true, // TODO: Add real-time check
                    'email' => $user->email,
                ];
            });

        return response()->json($users);
    }
}
