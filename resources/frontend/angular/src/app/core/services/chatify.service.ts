import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable, Subject } from 'rxjs';
import { CommonError } from '@core/error-handler/common-error';
import { CommonHttpErrorService } from '@core/error-handler/common-http-error.service';
import { catchError } from 'rxjs/operators';
import Pusher from 'pusher-js';

@Injectable({
  providedIn: 'root'
})
export class ChatifyService {
  private pusher: Pusher;
  private channel: any;
  private messageReceived = new Subject<any>();
  private userStatusChanged = new Subject<any>();

  constructor(
    private httpClient: HttpClient,
    private commonHttpErrorService: CommonHttpErrorService
  ) {
    // Initialize Pusher
    this.initializePusher();
  }

  private getCSRFToken(): string {
    const tokenElement = document.querySelector('meta[name="csrf-token"]');
    return tokenElement ? tokenElement.getAttribute('content') : '';
  }

  private initializePusher(): void {
    // Get Pusher credentials from environment
    const token = localStorage.getItem('bearerToken');
    this.pusher = new Pusher('2d9254cb3b57b0552c02', {
      cluster: 'ap1',
      forceTLS: true,
      authEndpoint: '/chatify/auth',
      auth: {
        headers: {
          'X-CSRF-Token': this.getCSRFToken(),
          'X-Requested-With': 'XMLHttpRequest',
          'Authorization': 'Bearer ' + token
        }
      }
    });

    // Subscribe to presence channel for online/offline status
    const presenceChannel = this.pusher.subscribe('presence-activeStatus');

    presenceChannel.bind('pusher:member_added', (member) => {
      this.userStatusChanged.next({ id: member.id, status: true });
    });

    presenceChannel.bind('pusher:member_removed', (member) => {
      this.userStatusChanged.next({ id: member.id, status: false });
    });
  }

  // Subscribe to a specific user's channel
  subscribeToUser(userId: string): void {
    // Unsubscribe from previous channel if exists
    if (this.channel) {
      this.pusher.unsubscribe(this.channel.name);
    }

    // Subscribe to the new channel
    const channelName = 'private-chatify.' + userId;
    this.channel = this.pusher.subscribe(channelName);

    // Listen for new messages
    this.channel.bind('messaging', (data) => {
      this.messageReceived.next(data);
    });
  }

  // Get message received observable
  getMessageReceived(): Observable<any> {
    return this.messageReceived.asObservable();
  }

  // Get user status changed observable
  getUserStatusChanged(): Observable<any> {
    return this.userStatusChanged.asObservable();
  }

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
