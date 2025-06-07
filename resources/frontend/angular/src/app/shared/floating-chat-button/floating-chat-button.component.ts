import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { ChatPopupComponent } from '../chat-popup/chat-popup.component';

@Component({
  selector: 'app-floating-chat-button',
  templateUrl: './floating-chat-button.component.html',
  styleUrls: ['./floating-chat-button.component.scss']
})
export class FloatingChatButtonComponent implements OnInit {
  isChatOpen = false;
  dialogRef: any;

  constructor(private dialog: MatDialog) { }

  ngOnInit(): void {
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
