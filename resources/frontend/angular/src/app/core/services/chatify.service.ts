import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { CommonError } from '@core/error-handler/common-error';
import { CommonHttpErrorService } from '@core/error-handler/common-http-error.service';
import { catchError } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class ChatifyService {
  constructor(
    private httpClient: HttpClient,
    private commonHttpErrorService: CommonHttpErrorService
  ) {}

  /**
   * Get all contacts (users)
   */
  getContacts(): Observable<any | CommonError> {
    const url = 'chatify/getContacts';
    return this.httpClient.get<any>(url)
      .pipe(catchError(error => this.commonHttpErrorService.handleError(error)));
  }

  /**
   * Get all messages for a specific user
   */
  getMessages(userId: string): Observable<any | CommonError> {
    const url = `chatify/fetchMessages`;
    const params = new HttpParams().set('id', userId);
    return this.httpClient.post<any>(url, { id: userId })
      .pipe(catchError(error => this.commonHttpErrorService.handleError(error)));
  }

  /**
   * Send a message to a user
   */
  sendMessage(message: string, userId: string, attachment: File | null = null): Observable<any | CommonError> {
    const url = `chatify/sendMessage`;
    const formData = new FormData();
    formData.append('message', message);
    formData.append('id', userId);

    if (attachment) {
      formData.append('file', attachment);
    }

    return this.httpClient.post<any>(url, formData)
      .pipe(catchError(error => this.commonHttpErrorService.handleError(error)));
  }

  /**
   * Make a user favorite
   */
  makeFavorite(userId: string): Observable<any | CommonError> {
    const url = `chatify/favorite`;
    return this.httpClient.post<any>(url, { user_id: userId })
      .pipe(catchError(error => this.commonHttpErrorService.handleError(error)));
  }

  /**
   * Get shared photos between users
   */
  getSharedPhotos(userId: string): Observable<any | CommonError> {
    const url = `chatify/shared/photos`;
    const params = new HttpParams().set('user_id', userId);
    return this.httpClient.post<any>(url, { user_id: userId })
      .pipe(catchError(error => this.commonHttpErrorService.handleError(error)));
  }

  /**
   * Search for users
   */
  searchUsers(query: string): Observable<any | CommonError> {
    const url = `chatify/search`;
    return this.httpClient.post<any>(url, { input: query })
      .pipe(catchError(error => this.commonHttpErrorService.handleError(error)));
  }
}
