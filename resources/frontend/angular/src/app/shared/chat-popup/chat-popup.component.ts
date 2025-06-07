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

    // Subscribe to real-time message updates
    this.sub$.sink = this.chatifyService.getMessageReceived()
      .subscribe(data => {
        // Check if we have a selected user and the message is from that user
        if (this.selectedUser && data.message &&
            (data.message.from_id === this.selectedUser.id || data.message.to_id === this.selectedUser.id)) {
          // Add the message to the messages array
          this.messages.push(data.message);

          // Scroll to the bottom of the messages container
          setTimeout(() => {
            const messagesContainer = document.querySelector('.popup-messages-container');
            if (messagesContainer) {
              messagesContainer.scrollTop = messagesContainer.scrollHeight;
            }
          }, 100);
        }
      });

    // Subscribe to real-time user status updates
    this.sub$.sink = this.chatifyService.getUserStatusChanged()
      .subscribe(data => {
        const contactIndex = this.contacts.findIndex(contact => contact.id === data.id);
        if (contactIndex !== -1) {
          this.contacts[contactIndex].active_status = data.status;

          // Update selected user status if it's the same user
          if (this.selectedUser && this.selectedUser.id === data.id) {
            this.selectedUser.active_status = data.status;
          }
        }
      });
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
    this.loadMessages(user.id);

    // Subscribe to the selected user's channel for real-time messages
    this.chatifyService.subscribeToUser(user.id);
  }

  loadMessages(userId: string): void {
    this.loading = true;
    this.sub$.sink = this.chatifyService.getMessages(userId)
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

    this.loading = true;
    this.sub$.sink = this.chatifyService.sendMessage(message, this.selectedUser.id, attachment)
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

  closeDialog(): void {
    this.dialogRef.close();
  }
}
