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
    script.onerror = (error) => {
      console.error('Error loading Jitsi script:', error);
      this.toastrService.error(this.translateService.instant('ERROR_LOADING_JITSI'));
      this.loading = false;
      this.router.navigate(['/meetings']);
    };
    document.body.appendChild(script);
  }

  getJitsiInfo() {
    this.loading = true;
    this.sub$.sink = this.meetingService.getJitsiInfo(this.meetingId)
      .subscribe(
        (response: any) => {
          this.initializeJitsiMeet(response);
          // Note: loading state is now managed in the initializeJitsiMeet method
          // and its event handlers to ensure it's only set to false when the
          // conference is actually joined or when an error occurs
        },
        (error) => {
          this.toastrService.error(this.translateService.instant('ERROR_JOINING_MEETING'));
          this.router.navigate(['/meetings']);
          this.loading = false;
        }
      );
  }

  initializeJitsiMeet(meetingInfo: any) {
    try {
      this.jitsiContainer = document.getElementById('jitsi-container');

      if (!this.jitsiContainer) {
        throw new Error('Jitsi container element not found');
      }

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
          startWithVideoMuted: false,
          prejoinPageEnabled: false
        },
        interfaceConfigOverwrite: {
          TOOLBAR_BUTTONS: [
            'microphone', 'camera', 'closedcaptions', 'desktop', 'fullscreen',
            'fodeviceselection', 'hangup', 'profile', 'chat', 'recording',
            'livestreaming', 'etherpad', 'sharedvideo', 'settings', 'raisehand',
            'videoquality', 'filmstrip', 'invite', 'feedback', 'stats', 'shortcuts',
            'tileview', 'videobackgroundblur', 'download', 'help', 'mute-everyone',
            'security'
          ],
          SHOW_JITSI_WATERMARK: false,
          DISABLE_JOIN_LEAVE_NOTIFICATIONS: true
        }
      };

      if (meetingInfo.jitsi_config.jwt) {
        options['jwt'] = meetingInfo.jitsi_config.jwt;
      }

      // Check if JitsiMeetExternalAPI is available
      if (typeof JitsiMeetExternalAPI === 'undefined') {
        console.log("error");
        throw new Error('Jitsi Meet External API not loaded');
      }

      // Create the Jitsi Meet API instance
      this.jitsiMeetApi = new JitsiMeetExternalAPI(meetingInfo.jitsi_config.domain, options);

      // Add event listeners
      this.jitsiMeetApi.addEventListeners({
        readyToClose: this.handleClose.bind(this),
        videoConferenceJoined: () => {
          console.log('User has joined the conference');
          this.loading = false;
        },
        videoConferenceLeft: () => {
          console.log('User has left the conference');
          this.handleClose();
        },
        error: (error) => {
          console.error('Jitsi Meet Error:', error);
          this.toastrService.error(this.translateService.instant('ERROR_JOINING_MEETING'));
          this.loading = false;
        }
      });
    } catch (error) {
      console.error('Error initializing Jitsi Meet:', error);
      this.toastrService.error(this.translateService.instant('ERROR_INITIALIZING_MEETING'));
      this.loading = false;
      this.router.navigate(['/meetings']);
    }
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
