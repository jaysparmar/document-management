import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { CommonHttpErrorService } from '@core/error-handler/common-http-error.service';
import { Meeting, JitsiConfig } from '@core/domain-classes/meeting';
import { Observable } from 'rxjs';
import { CommonError } from '@core/error-handler/common-error';
import { catchError } from 'rxjs/operators';

@Injectable({ providedIn: 'root' })
export class MeetingService {

  constructor(
    private httpClient: HttpClient,
    private commonHttpErrorService: CommonHttpErrorService) { }

  getAllMeetings(): Observable<Meeting[] | CommonError> {
    const url = `meetings`;
    return this.httpClient.get<Meeting[]>(url)
      .pipe(catchError(this.commonHttpErrorService.handleError));
  }

  getMyMeetings(): Observable<any | CommonError> {
    const url = `meetings/my`;
    return this.httpClient.get<any>(url)
      .pipe(catchError(this.commonHttpErrorService.handleError));
  }

  getMeeting(id: string): Observable<Meeting | CommonError> {
    const url = `meetings/${id}`;
    return this.httpClient.get<Meeting>(url)
      .pipe(catchError(this.commonHttpErrorService.handleError));
  }

  createMeeting(meeting: Meeting): Observable<Meeting | CommonError> {
    const url = `meetings`;
    return this.httpClient.post<Meeting>(url, meeting)
      .pipe(catchError(this.commonHttpErrorService.handleError));
  }

  updateMeeting(meeting: Meeting): Observable<Meeting | CommonError> {
    const url = `meetings/${meeting.id}`;
    return this.httpClient.put<Meeting>(url, meeting)
      .pipe(catchError(this.commonHttpErrorService.handleError));
  }

  deleteMeeting(id: string): Observable<void | CommonError> {
    const url = `meetings/${id}`;
    return this.httpClient.delete<void>(url)
      .pipe(catchError(this.commonHttpErrorService.handleError));
  }

  addUsersToMeeting(meetingId: string, userIds: string[]): Observable<Meeting | CommonError> {
    const url = `meetings/${meetingId}/users`;
    return this.httpClient.post<Meeting>(url, { user_ids: userIds })
      .pipe(catchError(this.commonHttpErrorService.handleError));
  }

  removeUserFromMeeting(meetingId: string, userId: string): Observable<Meeting | CommonError> {
    const url = `meetings/${meetingId}/users/${userId}`;
    return this.httpClient.delete<Meeting>(url)
      .pipe(catchError(this.commonHttpErrorService.handleError));
  }

  acceptMeetingInvitation(meetingId: string): Observable<Meeting | CommonError> {
    const url = `meetings/${meetingId}/accept`;
    return this.httpClient.post<Meeting>(url, {})
      .pipe(catchError(this.commonHttpErrorService.handleError));
  }

  getJitsiInfo(meetingId: string): Observable<any | CommonError> {
    const url = `meetings/${meetingId}/jitsi`;
    return this.httpClient.get<any>(url)
      .pipe(catchError(this.commonHttpErrorService.handleError));
  }
}
