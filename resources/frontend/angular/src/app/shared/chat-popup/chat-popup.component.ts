import { Component, OnInit, OnDestroy, Inject } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { ChatifyService } from '@core/services/chatify.service';
import { BaseComponent } from 'src/app/base.component';
import { ToastrService } from 'ngx-toastr';
import { SecurityService } from '@core/security/security.service';

@Component({
  selector: 'app-chat-popup',
  templateUrl: './chat-popup.component.html',
  styleUrls: ['./chat-popup.component.scss']
})
export class ChatPopupComponent extends BaseComponent implements OnInit, OnDestroy {
  contacts: any[] = [];
  selectedUser: any = null;
  messages: any[] = [];
  messageForm: FormGroup;
  loading = false;
  searchQuery = '';
  currentUser: any;

  constructor(
    private chatifyService: ChatifyService,
    private fb: FormBuilder,
    private toastr: ToastrService,
    private securityService: SecurityService,
    public dialogRef: MatDialogRef<ChatPopupComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any
  ) {
    super();
    this.messageForm = this.fb.group({
      message: ['', Validators.required],
      attachment: [null]
    });
  }

  ngOnInit(): void {
    this.currentUser = this.securityService.getUserDetail();
    this.loadContacts();

    // Subscribe to message updates from polling
    this.sub$.sink = this.chatifyService.getMessageReceived()
      .subscribe(data => {
        if (this.selectedUser && data.messages && data.messages.length > 0) {
          // Check if user is at bottom of chat before appending messages
          const messagesContainer = document.querySelector('.popup-messages-container');
          const isAtBottom = messagesContainer ?
            (messagesContainer.scrollHeight - messagesContainer.scrollTop <= messagesContainer.clientHeight + 50) :
            true;

          // Append new messages to the messages array
          this.messages = [...this.messages];

          // Only scroll to bottom if user was already at the bottom
          if (isAtBottom) {
            setTimeout(() => {
              if (messagesContainer) {
                messagesContainer.scrollTop = messagesContainer.scrollHeight;
              }
            }, 100);
          }
        }
      });

    // Subscribe to unread count updates
    this.sub$.sink = this.chatifyService.getUnreadCountChanged()
      .subscribe(count => {
        // Handle unread count updates if needed
        console.log('Unread messages:', count);
      });

    // Check for unread messages on init
    this.checkUnreadMessages();
  }

  // Check for unread messages
  checkUnreadMessages(): void {
    this.sub$.sink = this.chatifyService.getUnreadCount()
      .subscribe(
        (response: any) => {
          console.log('Initial unread count:', response.unread_count);
        },
        error => {
          console.error('Failed to get unread count:', error);
        }
      );
  }

  loadContacts(): void {
    this.loading = true;
    this.sub$.sink = this.chatifyService.getContacts()
      .subscribe(
        (response: any) => {
          this.contacts = response;
          this.loading = false;
        },
        error => {
          this.loading = false;
          this.toastr.error('Failed to load contacts');
        }
      );
  }

  selectUser(user: any): void {
    this.selectedUser = user;
    this.loadMessages(user.id, user.type || 'user');

    // Start polling for new messages with this user after a short delay
    // This ensures that loadMessages completes before polling starts
    setTimeout(() => {
      this.chatifyService.startPolling(user.id, user.type || 'user');
    }, 500);
  }

  override ngOnDestroy(): void {
    super.ngOnDestroy();
    // Stop polling when component is destroyed
    this.chatifyService.stopPolling();
  }

  refreshMessages(): void {
    if (this.selectedUser) {
      // Stop polling temporarily
      this.chatifyService.stopPolling();

      // Load messages
      this.loadMessages(this.selectedUser.id, this.selectedUser.type || 'user');

      // Restart polling after a short delay
      setTimeout(() => {
        this.chatifyService.startPolling(this.selectedUser.id, this.selectedUser.type || 'user');
      }, 500);
    }
  }

  loadMessages(userId: string, userType: string = 'user'): void {
    this.loading = true;
    // Clear messages array before loading new messages
    this.messages = [];

    this.sub$.sink = this.chatifyService.getMessages(userId, userType)
      .subscribe(
        (response: any) => {
          this.messages = response.messages;
          this.loading = false;

          // Scroll to the bottom of the messages container
          setTimeout(() => {
            const messagesContainer = document.querySelector('.popup-messages-container');
            if (messagesContainer) {
              messagesContainer.scrollTop = messagesContainer.scrollHeight;
            }
          }, 100);
        },
        error => {
          this.loading = false;
          this.toastr.error('Failed to load messages');
        }
      );
  }

  sendMessage(): void {
    if (this.messageForm.invalid || !this.selectedUser) {
      return;
    }

    const message = this.messageForm.get('message').value;
    const attachment = this.messageForm.get('attachment').value;
    const userType = this.selectedUser.type || 'user';

    this.loading = true;
    this.sub$.sink = this.chatifyService.sendMessage(message, this.selectedUser.id, attachment, userType)
      .subscribe(
        (response: any) => {
          this.messages.push(response.message);
          this.messageForm.reset();
          this.loading = false;

          // Scroll to the bottom of the messages container
          setTimeout(() => {
            const messagesContainer = document.querySelector('.popup-messages-container');
            if (messagesContainer) {
              messagesContainer.scrollTop = messagesContainer.scrollHeight;
            }
          }, 100);
        },
        error => {
          this.loading = false;
          this.toastr.error('Failed to send message');
        }
      );
  }

  searchUsers(): void {
    if (!this.searchQuery.trim()) {
      this.loadContacts();
      return;
    }

    this.loading = true;
    this.sub$.sink = this.chatifyService.searchUsers(this.searchQuery)
      .subscribe(
        (response: any) => {
          this.contacts = response;
          this.loading = false;
        },
        error => {
          this.loading = false;
          this.toastr.error('Failed to search users');
        }
      );
  }

  onFileSelected(event: any): void {
    if (event.target.files.length > 0) {
      const file = event.target.files[0];
      this.messageForm.patchValue({
        attachment: file
      });
    }
  }

  isOwnMessage(message: any): boolean {
    // Use the isMine flag if available, otherwise fall back to comparing IDs
    return message.isMine !== undefined ? message.isMine : message.from_id === this.currentUser.id;
  }

  isImage(filename: string): boolean {
    if (!filename) return false;
    const imageExtensions = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp', 'svg'];
    const extension = filename.split('.').pop()?.toLowerCase();
    return extension ? imageExtensions.includes(extension) : false;
  }

  handleImageError(event: any): void {
    // Hide the image if it fails to load
    event.target.style.display = 'none';

    // Log error for debugging
    console.error('Failed to load image:', event.target.src);

    // Optionally show a message or fallback image
    const errorDiv = document.createElement('div');
    errorDiv.className = 'image-error';
    errorDiv.textContent = 'Image could not be loaded';
    event.target.parentNode.appendChild(errorDiv);
  }

  closeDialog(): void {
    this.dialogRef.close();
  }
}
