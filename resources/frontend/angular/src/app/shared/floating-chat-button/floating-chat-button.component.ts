import { Component, OnInit, OnDestroy } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { ChatPopupComponent } from '../chat-popup/chat-popup.component';
import { Router, NavigationEnd } from '@angular/router';
import { filter } from 'rxjs/operators';
import { Subscription } from 'rxjs';

@Component({
  selector: 'app-floating-chat-button',
  templateUrl: './floating-chat-button.component.html',
  styleUrls: ['./floating-chat-button.component.scss']
})
export class FloatingChatButtonComponent implements OnInit, OnDestroy {
  isChatOpen = false;
  dialogRef: any;
  isOnChatPage = false;
  private routerSubscription: Subscription;

  constructor(private dialog: MatDialog, private router: Router) { }

  ngOnInit(): void {
    // Check initial route
    this.isOnChatPage = this.router.url === '/chat';

    // Subscribe to route changes
    this.routerSubscription = this.router.events.pipe(
      filter(event => event instanceof NavigationEnd)
    ).subscribe((event: NavigationEnd) => {
      this.isOnChatPage = event.url === '/chat';
    });
  }

  ngOnDestroy(): void {
    if (this.routerSubscription) {
      this.routerSubscription.unsubscribe();
    }
  }

  /**
   * Opens the chat popup when the floating button is clicked
   */
  openChat(): void {
    if (this.dialogRef) {
      // If dialog is already open, focus it
      this.dialogRef.componentInstance.isMinimized = false;
    } else {
      // Open new dialog
      this.dialogRef = this.dialog.open(ChatPopupComponent, {
        width: '800px',
        height: '600px',
        panelClass: 'chat-popup-dialog',
        disableClose: true,
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
    }
  }
}
