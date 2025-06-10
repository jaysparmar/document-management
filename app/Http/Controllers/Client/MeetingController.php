<?php

namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use App\Helpers\ClientHelper;
use App\Models\Meeting;
use App\Services\JitsiService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class MeetingController extends Controller
{
    /**
     * The Jitsi service instance.
     *
     * @var \App\Services\JitsiService
     */
    protected $jitsiService;

    /**
     * Create a new controller instance.
     *
     * @param  \App\Services\JitsiService  $jitsiService
     * @return void
     */
    public function __construct(JitsiService $jitsiService)
    {
        $this->jitsiService = $jitsiService;
    }
    /**
     * Display a listing of the meetings for the logged-in client.
     *
     * @return \Illuminate\View\View
     */
    public function index()
    {
        // Check if client is authenticated
        if (!ClientHelper::isAuthenticated()) {
            return redirect()->route('client-portal.login');
        }

        // Get client details
        $client = ClientHelper::getAuthClient();

        // Get all meetings for the client
        $meetings = $client->meetings()
            ->with('creator') // Include creator details
            ->orderBy('start_time', 'desc') // Order by start time (newest first)
            ->get();

        return view('client.meetings.index', compact('client', 'meetings'));
    }

    /**
     * Display the specified meeting.
     *
     * @param  string  $id
     * @return \Illuminate\View\View
     */
    public function show($id)
    {
        // Check if client is authenticated
        if (!ClientHelper::isAuthenticated()) {
            return redirect()->route('client-portal.login');
        }

        // Get client details
        $client = ClientHelper::getAuthClient();

        // Get the meeting
        $meeting = $client->meetings()->with('creator')->find($id);

        if (!$meeting) {
            return redirect()->route('client-portal.meetings.index')
                ->with('error', 'Meeting not found or you do not have access to it.');
        }

        return view('client.meetings.show', compact('client', 'meeting'));
    }

    /**
     * Accept a meeting invitation.
     *
     * @param  string  $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function accept($id)
    {
        // Check if client is authenticated
        if (!ClientHelper::isAuthenticated()) {
            return redirect()->route('client-portal.login');
        }

        // Get client details
        $client = ClientHelper::getAuthClient();

        // Get the meeting
        $meeting = $client->meetings()->find($id);

        if (!$meeting) {
            return redirect()->route('client-portal.meetings.index')
                ->with('error', 'Meeting not found or you do not have access to it.');
        }

        // Update the pivot table to mark the meeting as accepted
        $client->meetings()->updateExistingPivot($id, ['is_accepted' => true]);

        return redirect()->route('client-portal.meetings.index')
            ->with('success', 'Meeting invitation accepted successfully.');
    }

    /**
     * Get Jitsi meeting information.
     *
     * @param  string  $id
     * @return \Illuminate\Http\Response
     */
    public function getJitsiInfo($id)
    {
        // Check if client is authenticated
        if (!ClientHelper::isAuthenticated()) {
            return response()->json(['message' => 'Unauthorized'], 401);
        }

        // Get client details
        $client = ClientHelper::getAuthClient();

        // Get the meeting
        $meeting = $client->meetings()->find($id);

        if (!$meeting) {
            return response()->json(['message' => 'Meeting not found or you do not have access to it.'], 404);
        }

        // Get display name
        $displayName = $client->contactPerson;

        // Get Jitsi meeting configuration
        $configData = [
            'startTime' => $meeting->start_time,
            'endTime' => $meeting->end_time,
            'clientId' => $client->id,
            'email' => $client->email
        ];

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
            'jitsiConfig' => $jitsiConfig,
            'participant_type' => 'client',
            'participant_id' => $client->id
        ];

        return response()->json($responseData);
    }

    /**
     * Join a meeting.
     *
     * @param  string  $id
     * @return \Illuminate\View\View
     */
    public function join($id)
    {
        // Check if client is authenticated
        if (!ClientHelper::isAuthenticated()) {
            return redirect()->route('client-portal.login');
        }

        // Get client details
        $client = ClientHelper::getAuthClient();

        // Get the meeting
        $meeting = $client->meetings()->with('creator')->find($id);

        if (!$meeting) {
            return redirect()->route('client-portal.meetings.index')
                ->with('error', 'Meeting not found or you do not have access to it.');
        }

        // If the meeting is not accepted yet, accept it automatically
        if (!$meeting->pivot->is_accepted) {
            $client->meetings()->updateExistingPivot($id, ['is_accepted' => true]);
            $meeting->pivot->is_accepted = true;
        }

        return view('client.meetings.join', compact('client', 'meeting'));
    }
}
