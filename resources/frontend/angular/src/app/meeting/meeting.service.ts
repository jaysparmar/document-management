import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { CommonHttpErrorService } from '@core/error-handler/common-http-error.service';
import { Meeting, JitsiConfig } from '@core/domain-classes/meeting';
import { Observable } from 'rxjs';
import { CommonError } from '@core/error-handler/common-error';
import { catchError, map } from 'rxjs/operators';

@Injectable({ providedIn: 'root' })
export class MeetingService {

  constructor(
    private httpClient: HttpClient,
    private commonHttpErrorService: CommonHttpErrorService) { }

  // Convert snake_case keys to camelCase
  private toCamelCase(data: any): any {
    if (Array.isArray(data)) {
      return data.map(item => this.toCamelCase(item));
    }

    if (data !== null && typeof data === 'object') {
      const newObj = {};

      Object.keys(data).forEach(key => {
        // Convert key from snake_case to camelCase
        const camelKey = key.replace(/_([a-z])/g, (_, letter) => letter.toUpperCase());

        // Recursively convert nested objects
        newObj[camelKey] = this.toCamelCase(data[key]);

        // For backward compatibility, keep original snake_case keys for specific properties
        if (key === 'start_time' || key === 'end_time' || key === 'jitsi_meeting_id') {
          newObj[key] = data[key];
        }
      });

      return newObj;
    }

    return data;
  }

  // Convert camelCase keys to snake_case for API requests
  private toSnakeCase(data: any): any {
    if (Array.isArray(data)) {
      return data.map(item => this.toSnakeCase(item));
    }

    if (data !== null && typeof data === 'object') {
      const newObj = {};

      Object.keys(data).forEach(key => {
        // Skip backward compatibility properties
        if (key === 'start_time' || key === 'end_time' || key === 'jitsi_meeting_id') {
          return;
        }

        // Convert key from camelCase to snake_case
        const snakeKey = key.replace(/([A-Z])/g, '_$1').toLowerCase();

        // Recursively convert nested objects
        newObj[snakeKey] = this.toSnakeCase(data[key]);
      });

      return newObj;
    }

    return data;
  }

  getAllMeetings(): Observable<Meeting[] | CommonError> {
    const url = `meetings`;
    return this.httpClient.get<any[]>(url)
      .pipe(
        map(data => this.toCamelCase(data) as Meeting[]),
        catchError(this.commonHttpErrorService.handleError)
      );
  }

  getMyMeetings(): Observable<any | CommonError> {
    const url = `meetings/my`;
    return this.httpClient.get<any>(url)
      .pipe(
        map(data => this.toCamelCase(data)),
        catchError(this.commonHttpErrorService.handleError)
      );
  }

  getMeeting(id: string): Observable<Meeting | CommonError> {
    const url = `meetings/${id}`;
    return this.httpClient.get<any>(url)
      .pipe(
        map(data => this.toCamelCase(data) as Meeting),
        catchError(this.commonHttpErrorService.handleError)
      );
  }

  createMeeting(meeting: Meeting): Observable<Meeting | CommonError> {
    const url = `meetings`;
    return this.httpClient.post<any>(url, this.toSnakeCase(meeting))
      .pipe(
        map(data => this.toCamelCase(data) as Meeting),
        catchError(this.commonHttpErrorService.handleError)
      );
  }

  updateMeeting(meeting: Meeting): Observable<Meeting | CommonError> {
    const url = `meetings/${meeting.id}`;
    return this.httpClient.put<any>(url, this.toSnakeCase(meeting))
      .pipe(
        map(data => this.toCamelCase(data) as Meeting),
        catchError(this.commonHttpErrorService.handleError)
      );
  }

  deleteMeeting(id: string): Observable<void | CommonError> {
    const url = `meetings/${id}`;
    return this.httpClient.delete<void>(url)
      .pipe(catchError(this.commonHttpErrorService.handleError));
  }

  addUsersToMeeting(meetingId: string, userIds: string[]): Observable<Meeting | CommonError> {
    const url = `meetings/${meetingId}/users`;
    // Keep using snake_case for API request
    return this.httpClient.post<any>(url, { user_ids: userIds })
      .pipe(
        map(data => this.toCamelCase(data) as Meeting),
        catchError(this.commonHttpErrorService.handleError)
      );
  }

  removeUserFromMeeting(meetingId: string, userId: string): Observable<Meeting | CommonError> {
    const url = `meetings/${meetingId}/users/${userId}`;
    return this.httpClient.delete<any>(url)
      .pipe(
        map(data => this.toCamelCase(data) as Meeting),
        catchError(this.commonHttpErrorService.handleError)
      );
  }

  addClientsToMeeting(meetingId: string, clientIds: string[]): Observable<Meeting | CommonError> {
    const url = `meetings/${meetingId}/clients`;
    // Keep using snake_case for API request
    return this.httpClient.post<any>(url, { client_ids: clientIds })
      .pipe(
        map(data => this.toCamelCase(data) as Meeting),
        catchError(this.commonHttpErrorService.handleError)
      );
  }

  removeClientFromMeeting(meetingId: string, clientId: string): Observable<Meeting | CommonError> {
    const url = `meetings/${meetingId}/clients/${clientId}`;
    return this.httpClient.delete<any>(url)
      .pipe(
        map(data => this.toCamelCase(data) as Meeting),
        catchError(this.commonHttpErrorService.handleError)
      );
  }

  acceptMeetingInvitation(meetingId: string): Observable<Meeting | CommonError> {
    const url = `meetings/${meetingId}/accept`;
    return this.httpClient.post<any>(url, {})
      .pipe(
        map(data => this.toCamelCase(data) as Meeting),
        catchError(this.commonHttpErrorService.handleError)
      );
  }

  getJitsiInfo(meetingId: string): Observable<any | CommonError> {
    const url = `meetings/${meetingId}/jitsi`;
    return this.httpClient.get<any>(url)
      .pipe(
        map(data => this.toCamelCase(data)),
        catchError(this.commonHttpErrorService.handleError)
      );
  }
}
