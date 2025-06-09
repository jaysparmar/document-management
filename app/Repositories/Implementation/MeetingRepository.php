<?php

namespace App\Repositories\Implementation;

use App\Models\Meeting;
use App\Models\MeetingUser;
use App\Models\Users;
use Illuminate\Support\Facades\Auth;
use App\Repositories\Implementation\BaseRepository;
use App\Repositories\Contracts\MeetingRepositoryInterface;
use Illuminate\Support\Facades\DB;
use Ramsey\Uuid\Uuid;

/**
 * Class MeetingRepository.
 */
class MeetingRepository extends BaseRepository implements MeetingRepositoryInterface
{
    /**
     * @var Model
     */
    protected $model;

    /**
     * BaseRepository constructor.
     */
    function __construct()
    {
        parent::__construct();
    }

    public static function model()
    {
        return Meeting::class;
    }

    public function createMeeting(array $attributes)
    {
        try {
            DB::beginTransaction();

            // Generate a unique Jitsi meeting ID
            $attributes['jitsi_meeting_id'] = Uuid::uuid4()->toString();

            // Create the meeting
            $model = $this->model->newInstance($attributes);
            $model->save();
            $this->resetModel();
            $result = $this->parseResult($model);

            // Add users to the meeting
            if (isset($attributes['user_ids']) && is_array($attributes['user_ids'])) {
                foreach ($attributes['user_ids'] as $userId) {
                    // Check if user is already in the meeting
                    if (!$model->users()->where('user_id', $userId)->exists()) {
                        // Create a new MeetingUser instance with UUID
                        $meetingUser = new MeetingUser();
                        $meetingUser->id = Uuid::uuid4()->toString();
                        $meetingUser->meeting_id = $model->id;
                        $meetingUser->user_id = $userId;
                        $meetingUser->is_accepted = false;
                        $meetingUser->save();
                    }
                }
            }

            DB::commit();
            return $result;
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'message' => 'Error in saving data: ' . $e->getMessage(),
            ], 409);
        }
    }

    public function findMeeting($id)
    {
        $model = $this->model->with('users')->with('creator')->findOrFail($id);
        $this->resetModel();
        return $this->parseResult($model);
    }

    public function updateMeeting($model, $id, array $userIds)
    {
        try {
            DB::beginTransaction();

            // Update the meeting
            $model->save();
            $this->resetModel();
            $result = $this->parseResult($model);

            // Update meeting participants
            if (is_array($userIds)) {
                $meeting = Meeting::findOrFail($id);

                // First, remove users that are not in the array
                $existingUserIds = $meeting->users()->pluck('user_id')->toArray();
                $userIdsToRemove = array_diff($existingUserIds, $userIds);

                foreach ($userIdsToRemove as $userId) {
                    $meeting->users()->detach($userId);
                }

                // Then, add new users with UUID
                foreach ($userIds as $userId) {
                    if (!$meeting->users()->where('user_id', $userId)->exists()) {
                        // Create a new MeetingUser instance with UUID
                        $meetingUser = new MeetingUser();
                        $meetingUser->id = Uuid::uuid4()->toString();
                        $meetingUser->meeting_id = $meeting->id;
                        $meetingUser->user_id = $userId;
                        $meetingUser->is_accepted = false;
                        $meetingUser->save();
                    }
                }
            }

            DB::commit();
            return $result;
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'message' => 'Error in saving data: ' . $e->getMessage(),
            ], 409);
        }
    }

    public function addUsersToMeeting($meetingId, array $userIds)
    {
        try {
            $meeting = Meeting::findOrFail($meetingId);

            foreach ($userIds as $userId) {
                // Check if user is already in the meeting
                if (!$meeting->users()->where('user_id', $userId)->exists()) {
                    // Create a new MeetingUser instance with UUID
                    $meetingUser = new MeetingUser();
                    $meetingUser->id = Uuid::uuid4()->toString();
                    $meetingUser->meeting_id = $meeting->id;
                    $meetingUser->user_id = $userId;
                    $meetingUser->is_accepted = false;
                    $meetingUser->save();
                }
            }

            return $meeting;
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Error adding users to meeting: ' . $e->getMessage(),
            ], 409);
        }
    }

    public function removeUserFromMeeting($meetingId, $userId)
    {
        try {
            $meeting = Meeting::findOrFail($meetingId);
            $meeting->users()->detach($userId);

            return $meeting;
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Error removing user from meeting: ' . $e->getMessage(),
            ], 409);
        }
    }

    public function getUserMeetings($userId)
    {
        try {
            // Get meetings created by the user
            $createdMeetings = Meeting::where('created_by', $userId)->get();

            // Get meetings the user is invited to
            $user = Users::findOrFail($userId);
            $invitedMeetings = $user->meetings;

            return [
                'created' => $createdMeetings,
                'invited' => $invitedMeetings
            ];
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Error retrieving user meetings: ' . $e->getMessage(),
            ], 409);
        }
    }

    public function acceptMeetingInvitation($meetingId, $userId)
    {
        try {
            $meeting = Meeting::findOrFail($meetingId);

            // Update the pivot table to mark the invitation as accepted
            $meeting->users()->updateExistingPivot($userId, ['is_accepted' => true]);

            return $meeting;
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Error accepting meeting invitation: ' . $e->getMessage(),
            ], 409);
        }
    }
}
