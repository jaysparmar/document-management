import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Meeting } from '@core/domain-classes/meeting';
import { MeetingService } from '../meeting.service';
import { BaseComponent } from 'src/app/base.component';
import { TranslateService } from '@ngx-translate/core';
import { ToastrService } from 'ngx-toastr';
import { SecurityService } from '@core/security/security.service';

@Component({
  selector: 'app-meeting-list',
  templateUrl: './meeting-list.component.html',
  styleUrls: ['./meeting-list.component.scss']
})
export class MeetingListComponent extends BaseComponent implements OnInit {
  meetings: Meeting[] = [];
  loading = false;
  currentUserId: string;

  constructor(
    private meetingService: MeetingService,
    private router: Router,
    private translateService: TranslateService,
    private toastrService: ToastrService,
    private securityService: SecurityService
  ) {
    super();
  }

  log(data:any):void{
    console.log('Debug:',data);
  }

  ngOnInit(): void {
    const userInfo = this.securityService.getUserDetail();
    if (userInfo && userInfo.user) {
      this.currentUserId = userInfo.user.id;
    }
    this.loadMeetings();
  }

  loadMeetings(): void {
    this.loading = true;
    this.sub$.sink = this.meetingService.getMyMeetings()
      .subscribe(
        (result: any) => {
          this.meetings = [...result.created, ...result.invited];
          this.loading = false;
        },
        () => {
          this.loading = false;
        }
      );
  }

  addMeeting(): void {
    this.router.navigate(['/meetings/add']);
  }

  editMeeting(meeting: Meeting): void {
    this.router.navigate([`/meetings/edit/${meeting.id}`]);
  }

  deleteMeeting(meeting: Meeting): void {
    if (confirm(this.translateService.instant('ARE_YOU_SURE_YOU_WANT_TO_DELETE'))) {
      this.sub$.sink = this.meetingService.deleteMeeting(meeting.id)
        .subscribe(() => {
          this.toastrService.success(this.translateService.instant('MEETING_DELETED_SUCCESSFULLY'));
          this.loadMeetings();
        });
    }
  }

  joinMeeting(meeting: Meeting): void {
    this.router.navigate([`/meetings/join/${meeting.id}`]);
  }
}
