export interface Meeting {
    id?: string;
    title: string;
    description?: string;
    start_time: Date;
    end_time: Date;
    jitsi_meeting_id?: string;
    createdBy?: string;
    isDeleted?: boolean;
    creator?: any;
    users?: any[];
}

export interface MeetingUser {
    id?: string;
    meeting_id: string;
    user_id: string;
    is_accepted: boolean;
    user?: any;
}

export interface JitsiConfig {
    domain: string;
    roomName: string;
    displayName: string;
    email?: string;
    startTime?: Date;
    endTime?: Date;
}
