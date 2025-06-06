import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Meeting } from '@core/domain-classes/meeting';
import { SecurityService } from '@core/security/security.service';
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

  constructor(
    private fb: FormBuilder,
    private meetingService: MeetingService,
    private router: Router,
    private route: ActivatedRoute,
    private translateService: TranslateService,
    private toastrService: ToastrService,
    private securityService: SecurityService
  ) {
    super();
  }

  ngOnInit(): void {
    this.createMeetingForm();
    this.route.params.subscribe(params => {
      if (params['id']) {
        this.meetingId = params['id'];
        this.isEditMode = true;
        this.getMeeting();
      }
    });
  }

  createMeetingForm() {
    this.meetingForm = this.fb.group({
      title: ['', [Validators.required]],
      description: [''],
      start_time: ['', [Validators.required]],
      end_time: ['', [Validators.required]],
      user_ids: [[]]
    });
  }

  getMeeting() {
    this.loading = true;
    this.sub$.sink = this.meetingService.getMeeting(this.meetingId)
      .subscribe(
        (meeting: Meeting) => {
          this.meetingForm.patchValue(meeting);
          this.loading = false;
        },
        () => {
          this.loading = false;
        }
      );
  }

  saveMeeting() {
    if (this.meetingForm.valid) {
      this.loading = true;
      const meeting = this.meetingForm.value as Meeting;

      if (this.isEditMode) {
        meeting.id = this.meetingId;
        this.sub$.sink = this.meetingService.updateMeeting(meeting)
          .subscribe(
            () => {
              this.toastrService.success(this.translateService.instant('MEETING_UPDATED_SUCCESSFULLY'));
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
            () => {
              this.toastrService.success(this.translateService.instant('MEETING_CREATED_SUCCESSFULLY'));
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
