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
            'user_ids.*' => 'exists:users,id'
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
            'user_ids.*' => 'exists:users,id'
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

        return response()->json($this->meetingRepository->updateMeeting($meeting, $id, $request->user_ids ?? []));
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
     * Accept a meeting invitation.
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

        return response()->json($this->meetingRepository->acceptMeetingInvitation($id, $userId));
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

        // Check if user is the creator or an invited user who has accepted
        $isCreator = $meeting->created_by === $userId;
        $isAcceptedParticipant = $meeting->users()
            ->where('user_id', $userId)
            ->where('is_accepted', true)
            ->exists();

        if (!$isCreator && !$isAcceptedParticipant) {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        $user = Auth::user();
        $displayName = $user->firstName . ' ' . $user->lastName;

        // Get Jitsi meeting configuration
        $jitsiConfig = $this->jitsiService->getMeetingConfig(
            $meeting->jitsi_meeting_id,
            $meeting->title,
            $displayName,
            [
                'email' => $user->email,
                'startTime' => $meeting->start_time,
                'endTime' => $meeting->end_time
            ]
        );

        // Generate JWT token if using secure Jitsi
        $jwt = $this->jitsiService->generateJWT(
            $meeting->jitsi_meeting_id,
            $displayName,
            $user->email
        );

        if ($jwt) {
            $jitsiConfig['jwt'] = $jwt;
        }

        return response()->json([
            'meeting_id' => $meeting->jitsi_meeting_id,
            'room_name' => $meeting->title,
            'display_name' => $displayName,
            'start_time' => $meeting->start_time,
            'end_time' => $meeting->end_time,
            'jitsi_config' => $jitsiConfig
        ]);
    }
}
