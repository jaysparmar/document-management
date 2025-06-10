<?php

namespace App\Http\Controllers;

use App\Models\Meeting;
use App\Services\JitsiService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Repositories\Contracts\MeetingRepositoryInterface;

class MeetingController extends Controller
{
    private $meetingRepository;
    private $jitsiService;

    public function __construct(MeetingRepositoryInterface $meetingRepository, JitsiService $jitsiService)
    {
        $this->meetingRepository = $meetingRepository;
        $this->jitsiService = $jitsiService;
    }

    /**
     * Display a listing of the meetings.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return response()->json($this->meetingRepository->all());
    }

    /**
     * Get meetings for the authenticated user.
     *
     * @return \Illuminate\Http\Response
     */
    public function myMeetings()
    {
        $userId = Auth::id();
        return response()->json($this->meetingRepository->getUserMeetings($userId));
    }

    /**
     * Store a newly created meeting in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'start_time' => 'required|date',
            'end_time' => 'required|date|after:start_time',
            'user_ids' => 'nullable|array',
            'user_ids.*' => 'exists:users,id',
            'client_ids' => 'nullable|array',
            'client_ids.*' => 'exists:clients,id'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->messages(), 422);
        }

        $data = $request->all();
        $data['created_by'] = Auth::id();

        // Generate a unique Jitsi meeting ID
        $data['jitsi_meeting_id'] = $this->jitsiService->generateMeetingId();

        return response()->json($this->meetingRepository->createMeeting($data), 201);
    }

    /**
     * Display the specified meeting.
     *
     * @param  string  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return response()->json($this->meetingRepository->findMeeting($id));
    }

    /**
     * Update the specified meeting in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  string  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'start_time' => 'required|date',
            'end_time' => 'required|date|after:start_time',
            'user_ids' => 'nullable|array',
            'user_ids.*' => 'exists:users,id',
            'client_ids' => 'nullable|array',
            'client_ids.*' => 'exists:clients,id'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->messages(), 422);
        }

        $meeting = Meeting::findOrFail($id);

        // Check if user is authorized to update the meeting
        if ($meeting->created_by !== Auth::id()) {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        $meeting->title = $request->title;
        $meeting->description = $request->description;
        $meeting->start_time = $request->start_time;
        $meeting->end_time = $request->end_time;

        return response()->json($this->meetingRepository->updateMeeting($meeting, $id, $request->user_ids ?? [], $request->client_ids ?? []));
    }

    /**
     * Remove the specified meeting from storage.
     *
     * @param  string  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $meeting = Meeting::findOrFail($id);

        // Check if user is authorized to delete the meeting
        if ($meeting->created_by !== Auth::id()) {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        $meeting->isDeleted = 1;
        $meeting->save();

        return response()->json([], 204);
    }

    /**
     * Add users to a meeting.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  string  $id
     * @return \Illuminate\Http\Response
     */
    public function addUsers(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'user_ids' => 'required|array',
            'user_ids.*' => 'exists:users,id'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->messages(), 422);
        }

        $meeting = Meeting::findOrFail($id);

        // Check if user is authorized to add users to the meeting
        if ($meeting->created_by !== Auth::id()) {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        return response()->json($this->meetingRepository->addUsersToMeeting($id, $request->user_ids));
    }

    /**
     * Remove a user from a meeting.
     *
     * @param  string  $meetingId
     * @param  string  $userId
     * @return \Illuminate\Http\Response
     */
    public function removeUser($meetingId, $userId)
    {
        $meeting = Meeting::findOrFail($meetingId);

        // Check if user is authorized to remove users from the meeting
        if ($meeting->created_by !== Auth::id()) {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        return response()->json($this->meetingRepository->removeUserFromMeeting($meetingId, $userId));
    }

    /**
     * Add clients to a meeting.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  string  $id
     * @return \Illuminate\Http\Response
     */
    public function addClients(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'client_ids' => 'required|array',
            'client_ids.*' => 'exists:clients,id'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->messages(), 422);
        }

        $meeting = Meeting::findOrFail($id);

        // Check if user is authorized to add clients to the meeting
        if ($meeting->created_by !== Auth::id()) {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        return response()->json($this->meetingRepository->addClientsToMeeting($id, $request->client_ids));
    }

    /**
     * Remove a client from a meeting.
     *
     * @param  string  $meetingId
     * @param  string  $clientId
     * @return \Illuminate\Http\Response
     */
    public function removeClient($meetingId, $clientId)
    {
        $meeting = Meeting::findOrFail($meetingId);

        // Check if user is authorized to remove clients from the meeting
        if ($meeting->created_by !== Auth::id()) {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        return response()->json($this->meetingRepository->removeClientFromMeeting($meetingId, $clientId));
    }

    /**
     * Accept a meeting invitation.
     *
     * Note: This method is kept for backward compatibility but is no longer needed
     * as all invitations are now automatically accepted.
     *
     * @param  string  $id
     * @return \Illuminate\Http\Response
     */
    public function acceptInvitation($id)
    {
        $userId = Auth::id();

        // Check if user is invited to the meeting
        $meeting = Meeting::findOrFail($id);
        if (!$meeting->users()->where('user_id', $userId)->exists()) {
            return response()->json(['message' => 'You are not invited to this meeting'], 403);
        }

        // All invitations are now automatically accepted, so just return the meeting
        return response()->json($meeting);
    }

    /**
     * Get Jitsi meeting information.
     *
     * @param  string  $id
     * @return \Illuminate\Http\Response
     */
    public function getJitsiInfo($id)
    {
        $meeting = Meeting::findOrFail($id);
        $userId = Auth::id();

        // Check if user is the creator or an invited user or client
        $isCreator = $meeting->created_by === $userId;
        $isParticipant = $meeting->users()
            ->where('user_id', $userId)
            ->exists();

        // If this is a client accessing the meeting
        $isClient = false;
        if (Auth::guard('client')->check()) {
            $clientId = Auth::guard('client')->id();
            $isClient = $meeting->clients()
                ->where('client_id', $clientId)
                ->exists();
        }

        if (!$isCreator && !$isParticipant && !$isClient) {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        // Get display name based on whether it's a user or client
        if (Auth::guard('client')->check()) {
            $client = Auth::guard('client')->user();
            $displayName = $client->contactPerson;
        } else {
            $user = Auth::user();
            $displayName = $user->firstName . ' ' . $user->lastName;
        }

        // Get Jitsi meeting configuration
        $configData = [
            'startTime' => $meeting->start_time,
            'endTime' => $meeting->end_time
        ];

        if (Auth::guard('client')->check()) {
            $client = Auth::guard('client')->user();
            $configData['clientId'] = $client->id;
            $configData['email'] = $client->email;
        } else {
            $user = Auth::user();
            $configData['userId'] = $user->id;
            $configData['email'] = $user->email;
        }

        $jitsiConfig = $this->jitsiService->getMeetingConfig(
            $meeting->jitsi_meeting_id,
            $meeting->title,
            $displayName,
            $configData
        );



        $responseData = [
            'meeting_id' => $meeting->jitsi_meeting_id,
            'room_name' => $meeting->title,
            'display_name' => $displayName,
            'start_time' => $meeting->start_time,
            'end_time' => $meeting->end_time,
            'jitsi_config' => $jitsiConfig
        ];

        // Add participant type and ID
        if (Auth::guard('client')->check()) {
            $client = Auth::guard('client')->user();
            $responseData['participant_type'] = 'client';
            $responseData['participant_id'] = $client->id;
        } else {
            $user = Auth::user();
            $responseData['participant_type'] = 'user';
            $responseData['participant_id'] = $user->id;
        }

        return response()->json($responseData);
    }
}
