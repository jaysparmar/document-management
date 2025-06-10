<?php

namespace App\Repositories\Contracts;

use App\Repositories\Contracts\BaseRepositoryInterface;

interface MeetingRepositoryInterface extends BaseRepositoryInterface
{
    public function createMeeting(array $attributes);
    public function findMeeting($id);
    public function updateMeeting($model, $id, array $userIds, array $clientIds = []);
    public function addUsersToMeeting($meetingId, array $userIds);
    public function removeUserFromMeeting($meetingId, $userId);
    public function getUserMeetings($userId);
    public function acceptMeetingInvitation($meetingId, $userId);
    public function addClientsToMeeting($meetingId, array $clientIds);
    public function removeClientFromMeeting($meetingId, $clientId);
    public function acceptClientMeetingInvitation($meetingId, $clientId);
}
