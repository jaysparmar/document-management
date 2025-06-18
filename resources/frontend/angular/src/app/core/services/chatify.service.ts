import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable, Subject, interval, Subscription } from 'rxjs';
import { CommonError } from '@core/error-handler/common-error';
import { CommonHttpErrorService } from '@core/error-handler/common-http-error.service';
import { catchError, switchMap } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class ChatifyService {
  private messageReceived = new Subject<any>();
  private unreadCountChanged = new Subject<number>();
  private pollingInterval = 2000; // 2 seconds
  private selectedUserId: string | null = null;
  private selectedUserType: string = 'user';
  private lastMessageTimestamp: string | null = null;
  private isFirstFetch: boolean = true;
  private pollingSubscription: Subscription | null = null;
  private unreadCountPollingSubscription: Subscription | null = null;
  private _isPolling: boolean = false;
  private _isPollingUnreadCount: boolean = false;

  // Public getter for isPolling
  get isPolling(): boolean {
    return this._isPolling;
  }

  // Public getter for isPollingUnreadCount
  get isPollingUnreadCount(): boolean {
    return this._isPollingUnreadCount;
  }

  constructor(
    private httpClient: HttpClient,
    private commonHttpErrorService: CommonHttpErrorService
  ) {}

  private lastUnreadCount: number = 0;

  // Start polling for new messages
  startPolling(userId: string, userType: string = 'user'): void {
    // Stop any existing polling before starting a new one
    this.stopPolling();

    this.selectedUserId = userId;
    this.selectedUserType = userType;
    this.lastMessageTimestamp = null;
    // Set isFirstFetch to false since messages are already loaded by loadMessages
    this.isFirstFetch = false;
    this._isPolling = true;

    // Set up polling interval
    this.pollingSubscription = interval(this.pollingInterval)
      .pipe(
        switchMap(() => this.fetchNewMessages(userId, userType, this.lastMessageTimestamp, true))
      )
      .subscribe(
        (response: any) => {
          // If there are new messages, update the last message timestamp
          if (response.messages && response.messages.length > 0) {
            const lastMessage = response.messages[response.messages.length - 1];
            this.lastMessageTimestamp = lastMessage.createdAt;

            // Only emit messages if there are unread messages (skip first fetch as it's already loaded)
            if (response.unreadCount > 0) {
              this.messageReceived.next({
                messages: response.messages
              });
            }
          }

          // Only update unread count if it has changed
          if (response.unreadCount !== this.lastUnreadCount) {
            this.lastUnreadCount = response.unreadCount;
            this.unreadCountChanged.next(response.unreadCount);
          }
        },
        error => {
          console.error('Error polling for new messages:', error);
        }
      );
  }

  // Stop polling
  stopPolling(): void {
    // Unsubscribe from the polling subscription if it exists
    if (this.pollingSubscription) {
      this.pollingSubscription.unsubscribe();
      this.pollingSubscription = null;
    }

    this._isPolling = false;
    this.selectedUserId = null;
    this.lastMessageTimestamp = null;
  }

  // Start polling for unread count
  startPollingForUnreadCount(): void {
    // Stop any existing polling before starting a new one
    this.stopPollingForUnreadCount();

    this._isPollingUnreadCount = true;

    // Set up polling interval
    this.unreadCountPollingSubscription = interval(this.pollingInterval)
      .pipe(
        switchMap(() => this.getUnreadCount())
      )
      .subscribe(
        (response: any) => {
          // Only update unread count if it has changed
          if (response.unreadCount !== this.lastUnreadCount) {
            this.lastUnreadCount = response.unreadCount;
            this.unreadCountChanged.next(response.unreadCount);
          }
        },
        error => {
          console.error('Error polling for unread count:', error);
        }
      );
  }

  // Stop polling for unread count
  stopPollingForUnreadCount(): void {
    // Unsubscribe from the polling subscription if it exists
    if (this.unreadCountPollingSubscription) {
      this.unreadCountPollingSubscription.unsubscribe();
      this.unreadCountPollingSubscription = null;
    }

    this._isPollingUnreadCount = false;
  }

  // Fetch new messages since a given timestamp
  fetchNewMessages(userId: string, userType: string = 'user', since: string | null = null, isPolling: boolean = true): Observable<any | CommonError> {
    const url = `chatify/fetchNewMessages`;
    const body: any = { id: userId, type: userType };

    if (since) {
      body.since = since;
    }

    return this.httpClient.post<any>(url, body)
      .pipe(catchError(error => this.commonHttpErrorService.handleError(error)));
  }

  // Get unread count
  getUnreadCount(): Observable<any | CommonError> {
    const url = `chatify/getUnreadCount`;
    return this.httpClient.get<any>(url)
      .pipe(catchError(error => this.commonHttpErrorService.handleError(error)));
  }

  // Get message received observable
  getMessageReceived(): Observable<any> {
    return this.messageReceived.asObservable();
  }

  // Get unread count changed observable
  getUnreadCountChanged(): Observable<number> {
    return this.unreadCountChanged.asObservable();
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
   * Get all messages for a specific user or client
   */
  getMessages(userId: string, userType: string = 'user'): Observable<any | CommonError> {
    const url = `chatify/fetchMessages`;
    return this.httpClient.post<any>(url, { id: userId, type: userType })
      .pipe(catchError(error => this.commonHttpErrorService.handleError(error)));
  }

  /**
   * Send a message to a user or client
   */
  sendMessage(message: string, userId: string, attachment: File | null = null, userType: string = 'user'): Observable<any | CommonError> {
    const url = `chatify/sendMessage`;
    const formData = new FormData();
    formData.append('message', message);
    formData.append('id', userId);
    formData.append('type', userType);

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
