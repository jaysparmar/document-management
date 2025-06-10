<?php

namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use App\Helpers\ClientHelper;
use App\Models\Meeting;
use Illuminate\Http\Request;

class MeetingController extends Controller
{
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
}
