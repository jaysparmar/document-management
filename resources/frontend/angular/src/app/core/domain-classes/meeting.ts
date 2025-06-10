export interface Meeting {
    id?: string;
    title: string;
    description?: string;
    startTime: Date;
    endTime: Date;
    jitsiMeetingId?: string;
    createdBy?: string;
    isDeleted?: boolean;
    creator?: any;
    users?: any[];
    clients?: any[];

    // Keep snake_case properties for backward compatibility
    start_time?: Date;
    end_time?: Date;
    jitsi_meeting_id?: string;
}

export interface MeetingUser {
    id?: string;
    meetingId: string;
    userId: string;
    isAccepted: boolean;
    user?: any;

    // Keep snake_case properties for backward compatibility
    meeting_id?: string;
    user_id?: string;
    is_accepted?: boolean;
}

export interface JitsiConfig {
    domain: string;
    roomName: string;
    displayName: string;
    email?: string;
    startTime?: Date;
    endTime?: Date;
}
