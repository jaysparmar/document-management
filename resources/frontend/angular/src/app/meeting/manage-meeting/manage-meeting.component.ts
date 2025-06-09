import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Meeting } from '@core/domain-classes/meeting';
import { User } from '@core/domain-classes/user';
import { SecurityService } from '@core/security/security.service';
import { CommonService } from '@core/services/common.service';
import { TranslateService } from '@ngx-translate/core';
import { ToastrService } from 'ngx-toastr';
import { BaseComponent } from 'src/app/base.component';
import { MeetingService } from '../meeting.service';

@Component({
  selector: 'app-manage-meeting',
  templateUrl: './manage-meeting.component.html',
  styleUrls: ['./manage-meeting.component.scss']
})
export class ManageMeetingComponent extends BaseComponent implements OnInit {
  meetingForm: FormGroup;
  isEditMode = false;
  meetingId: string;
  loading = false;
  users: User[] = [];
  meetingLink: string = '';

  constructor(
    private fb: FormBuilder,
    private meetingService: MeetingService,
    private router: Router,
    private route: ActivatedRoute,
    private translateService: TranslateService,
    private toastrService: ToastrService,
    private securityService: SecurityService,
    private commonService: CommonService
  ) {
    super();
  }

  ngOnInit(): void {
    this.createMeetingForm();
    this.getUsers();
    this.route.params.subscribe(params => {
      if (params['id']) {
        this.meetingId = params['id'];
        this.isEditMode = true;
        this.getMeeting();
      }
    });
  }

  getUsers(): void {
    this.loading = true;
    const currentUser = this.securityService.getUserDetail();

    this.sub$.sink = this.commonService.getUsers().subscribe(
      (data: User[]) => {
        // Filter out the current user from the participants list
        if (currentUser && currentUser.user && currentUser.user.id) {
          this.users = data.filter(user => user.id !== currentUser.user.id);
        } else {
          this.users = data;
        }
        this.loading = false;
      },
      (error) => {
        this.loading = false;
        this.toastrService.error(this.translateService.instant('ERROR_LOADING_USERS'));
      }
    );
  }

  createMeetingForm() {
    this.meetingForm = this.fb.group({
      title: ['', [Validators.required]],
      description: [''],
      startTime: ['', [Validators.required]],
      endTime: ['', [Validators.required]],
      userIds: [[]]
    });
  }

  getMeeting() {
    this.loading = true;
    this.sub$.sink = this.meetingService.getMeeting(this.meetingId)
      .subscribe(
        (meeting: Meeting) => {
          this.meetingForm.patchValue(meeting);

          // Set selected users if available
          if (meeting.users && meeting.users.length > 0) {
            const userIds = meeting.users.map(user => user.id);
            this.meetingForm.get('userIds').setValue(userIds);
          }

          // Generate meeting link
          this.generateMeetingLink(meeting);

          this.loading = false;
        },
        () => {
          this.loading = false;
        }
      );
  }

  generateMeetingLink(meeting: Meeting) {
    // Generate a shareable link for the meeting
    const baseUrl = window.location.origin;
    this.meetingLink = `${baseUrl}/meetings/join/${meeting.id}`;
  }

  copyMeetingLink() {
    // Copy the meeting link to clipboard
    navigator.clipboard.writeText(this.meetingLink).then(() => {
      this.toastrService.success(this.translateService.instant('LINK_COPIED_TO_CLIPBOARD'));
    }, () => {
      this.toastrService.error(this.translateService.instant('FAILED_TO_COPY_LINK'));
    });
  }

  saveMeeting() {
    if (this.meetingForm.valid) {
      this.loading = true;
      const meeting = this.meetingForm.value as Meeting;

      if (this.isEditMode) {
        meeting.id = this.meetingId;
        this.sub$.sink = this.meetingService.updateMeeting(meeting)
          .subscribe(
            (updatedMeeting: Meeting) => {
              this.toastrService.success(this.translateService.instant('MEETING_UPDATED_SUCCESSFULLY'));
              this.generateMeetingLink(updatedMeeting);
              this.router.navigate(['/meetings']);
              this.loading = false;
            },
            () => {
              this.loading = false;
            }
          );
      } else {
        this.sub$.sink = this.meetingService.createMeeting(meeting)
          .subscribe(
            (newMeeting: Meeting) => {
              this.toastrService.success(this.translateService.instant('MEETING_CREATED_SUCCESSFULLY'));
              this.generateMeetingLink(newMeeting);
              this.router.navigate(['/meetings']);
              this.loading = false;
            },
            () => {
              this.loading = false;
            }
          );
      }
    } else {
      this.meetingForm.markAllAsTouched();
    }
  }

  cancel() {
    this.router.navigate(['/meetings']);
  }

  deleteMeeting() {
    if (this.isEditMode && confirm(this.translateService.instant('ARE_YOU_SURE_YOU_WANT_TO_DELETE'))) {
      this.loading = true;
      this.sub$.sink = this.meetingService.deleteMeeting(this.meetingId)
        .subscribe(
          () => {
            this.toastrService.success(this.translateService.instant('MEETING_DELETED_SUCCESSFULLY'));
            this.router.navigate(['/meetings']);
            this.loading = false;
          },
          () => {
            this.loading = false;
          }
        );
    }
  }
}
