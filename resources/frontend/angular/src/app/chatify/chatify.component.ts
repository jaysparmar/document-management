import { Component, OnInit, OnDestroy } from '@angular/core';
import { ChatifyService } from '@core/services/chatify.service';
import { BaseComponent } from 'src/app/base.component';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { SecurityService } from '@core/security/security.service';

@Component({
  selector: 'app-chatify',
  templateUrl: './chatify.component.html',
  styleUrls: ['./chatify.component.scss']
})
export class ChatifyComponent extends BaseComponent implements OnInit, OnDestroy {
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
    private securityService: SecurityService
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
  }

  loadMessages(userId: string): void {
    this.loading = true;
    this.sub$.sink = this.chatifyService.getMessages(userId)
      .subscribe(
        (response: any) => {
          this.messages = response.messages;
          this.loading = false;
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
    return message.from_id === this.currentUser.id;
  }
}
