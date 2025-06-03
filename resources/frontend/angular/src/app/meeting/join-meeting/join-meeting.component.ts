import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { SecurityService } from '@core/security/security.service';
import { TranslateService } from '@ngx-translate/core';
import { ToastrService } from 'ngx-toastr';
import { BaseComponent } from 'src/app/base.component';
import { MeetingService } from '../meeting.service';

@Component({
  selector: 'app-join-meeting',
  templateUrl: './join-meeting.component.html',
  styleUrls: ['./join-meeting.component.scss']
})
export class JoinMeetingComponent extends BaseComponent implements OnInit {
  meetingId: string;
  loading = false;
  jitsiApiLoaded = false;
  jitsiContainer: HTMLElement;
  jitsiMeetApi: any;

  constructor(
    private meetingService: MeetingService,
    private route: ActivatedRoute,
    private router: Router,
    private translateService: TranslateService,
    private toastrService: ToastrService,
    private securityService: SecurityService
  ) {
    super();
  }

  ngOnInit(): void {
    this.route.params.subscribe(params => {
      if (params['id']) {
        this.meetingId = params['id'];
        this.loadJitsiScript();
      } else {
        this.router.navigate(['/meetings']);
      }
    });
  }

  loadJitsiScript() {
    if (this.jitsiApiLoaded) {
      this.getJitsiInfo();
      return;
    }

    this.loading = true;
    const script = document.createElement('script');
    script.src = 'https://meet.jit.si/external_api.js';
    script.async = true;
    script.onload = () => {
      this.jitsiApiLoaded = true;
      this.getJitsiInfo();
    };
    document.body.appendChild(script);
  }

  getJitsiInfo() {
    this.loading = true;
    this.sub$.sink = this.meetingService.getJitsiInfo(this.meetingId)
      .subscribe(
        (response: any) => {
          this.initializeJitsiMeet(response);
          this.loading = false;
        },
        (error) => {
          this.toastrService.error(this.translateService.instant('ERROR_JOINING_MEETING'));
          this.router.navigate(['/meetings']);
          this.loading = false;
        }
      );
  }

  initializeJitsiMeet(meetingInfo: any) {
    this.jitsiContainer = document.getElementById('jitsi-container');

    const options = {
      roomName: meetingInfo.meeting_id,
      width: '100%',
      height: '100%',
      parentNode: this.jitsiContainer,
      userInfo: {
        displayName: meetingInfo.display_name,
        email: meetingInfo.jitsi_config.email
      },
      configOverwrite: {
        startWithAudioMuted: true,
        startWithVideoMuted: false
      },
      interfaceConfigOverwrite: {
        TOOLBAR_BUTTONS: [
          'microphone', 'camera', 'closedcaptions', 'desktop', 'fullscreen',
          'fodeviceselection', 'hangup', 'profile', 'chat', 'recording',
          'livestreaming', 'etherpad', 'sharedvideo', 'settings', 'raisehand',
          'videoquality', 'filmstrip', 'invite', 'feedback', 'stats', 'shortcuts',
          'tileview', 'videobackgroundblur', 'download', 'help', 'mute-everyone',
          'security'
        ]
      }
    };

    if (meetingInfo.jitsi_config.jwt) {
      options['jwt'] = meetingInfo.jitsi_config.jwt;
    }

    // @ts-ignore
    this.jitsiMeetApi = new JitsiMeetExternalAPI(meetingInfo.jitsi_config.domain, options);

    this.jitsiMeetApi.addEventListeners({
      readyToClose: this.handleClose.bind(this)
    });
  }

  handleClose() {
    if (this.jitsiMeetApi) {
      this.jitsiMeetApi.dispose();
    }
    this.router.navigate(['/meetings']);
  }

  leaveMeeting() {
    if (this.jitsiMeetApi) {
      this.jitsiMeetApi.executeCommand('hangup');
    }
    this.router.navigate(['/meetings']);
  }
}
