import { Component, OnInit, OnDestroy } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { ChatPopupComponent } from '../chat-popup/chat-popup.component';
import { Router, NavigationEnd } from '@angular/router';
import { filter } from 'rxjs/operators';
import { Subscription } from 'rxjs';
import { ChatifyService } from '@core/services/chatify.service';

@Component({
  selector: 'app-floating-chat-button',
  templateUrl: './floating-chat-button.component.html',
  styleUrls: ['./floating-chat-button.component.scss']
})
export class FloatingChatButtonComponent implements OnInit, OnDestroy {
  isChatOpen = false;
  dialogRef: any;
  isOnChatPage = false;
  unreadCount = 0;
  private routerSubscription: Subscription;
  private chatifySubscription: Subscription;

  constructor(
    private dialog: MatDialog,
    private router: Router,
    private chatifyService: ChatifyService
  ) { }

  ngOnInit(): void {
    // Check initial route
    this.isOnChatPage = this.router.url === '/chat';

    // Subscribe to route changes
    this.routerSubscription = this.router.events.pipe(
      filter(event => event instanceof NavigationEnd)
    ).subscribe((event: NavigationEnd) => {
      this.isOnChatPage = event.url === '/chat';
    });

    // Subscribe to unread count updates
    this.chatifySubscription = this.chatifyService.getUnreadCountChanged()
      .subscribe(count => {
        this.unreadCount = count;
      });

    // Initial check for unread messages
    this.checkUnreadMessages();

    // Start polling for unread messages
    this.startPollingForUnreadMessages();
  }

  ngOnDestroy(): void {
    if (this.routerSubscription) {
      this.routerSubscription.unsubscribe();
    }
    if (this.chatifySubscription) {
      this.chatifySubscription.unsubscribe();
    }
    // Stop polling when component is destroyed
    this.stopPollingForUnreadMessages();
  }

  // Check for unread messages
  private checkUnreadMessages(): void {
    this.chatifyService.getUnreadCount()
      .subscribe(
        (response: any) => {
          this.unreadCount = response.unread_count;
        },
        error => {
          console.error('Failed to get unread count:', error);
        }
      );
  }

  // Start polling for unread messages
  private startPollingForUnreadMessages(): void {
    // Start polling for unread count every 2 seconds
    this.chatifyService.startPollingForUnreadCount();
  }

  // Stop polling for unread messages
  private stopPollingForUnreadMessages(): void {
    // Stop polling for unread count
    this.chatifyService.stopPollingForUnreadCount();
  }

  /**
   * Opens the chat popup when the floating button is clicked
   */
  openChat(): void {
    if (this.dialogRef) {
      // If dialog is already open, focus it
      // No need to do anything, dialog is already open
    } else {
      // Open new dialog
      this.dialogRef = this.dialog.open(ChatPopupComponent, {
        width: '800px',
        height: '600px',
        panelClass: 'chat-popup-dialog',
        disableClose: false,
        autoFocus: false,
        position: {
          bottom: '30px',
          right: '30px'
        }
      });

      // Handle dialog close
      this.dialogRef.afterClosed().subscribe(() => {
        this.dialogRef = null;
        this.isChatOpen = false;
      });

      this.isChatOpen = true;

      // Reset unread count when chat is opened
      this.unreadCount = 0;
    }
  }
}
