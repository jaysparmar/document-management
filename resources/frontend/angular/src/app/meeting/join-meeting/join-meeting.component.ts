import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { SecurityService } from '@core/security/security.service';
import { TranslateService } from '@ngx-translate/core';
import { ToastrService } from 'ngx-toastr';
import { BaseComponent } from 'src/app/base.component';
import { MeetingService } from '../meeting.service';

// Declare the JitsiMeetExternalAPI type
declare var JitsiMeetExternalAPI: any;

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

    this.loading = false;
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

    this.sub$.sink = this.meetingService.getJitsiInfo(this.meetingId)
      .subscribe(
        (response: any) => {
          console.log(response)


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
      // Debug: Log the meetingInfo object to see its structure
      console.log('Meeting Info:', meetingInfo);

      // Validate meetingInfo object
      if (!meetingInfo || !meetingInfo.meetingId || !meetingInfo.displayName) {
        throw new Error('Invalid meeting information');
      }

      this.jitsiContainer = document.getElementById('jitsi-container');

      if (!this.jitsiContainer) {
        throw new Error('Jitsi container element not found');
      }

      // Ensure jitsi_config exists
      const jitsiConfig = meetingInfo.jitsiConfig || {};
      const domain = jitsiConfig.domain || 'meet.jit.si';


      const options = {
        roomName: meetingInfo.meetingId,
        width: '100%',
        height: '100%',
        parentNode: this.jitsiContainer,
        userInfo: {
          displayName: meetingInfo.displayName,
          // Use optional chaining and provide a default empty string if email is undefined
          email: jitsiConfig.email || ''
        },
        configOverwrite: {
          defaultLanguage: 'en',
          // startWithAudioMuted: true,
          // startWithVideoMuted: false,
          // prejoinPageEnabled: false
        },
        interfaceConfigOverwrite: {
          TOOLBAR_BUTTONS: [
            'microphone', 'camera', 'closedcaptions', 'desktop', 'fullscreen',
            'fodeviceselection', 'hangup', 'profile', 'chat', 'recording',
            'livestreaming', 'etherpad', 'sharedvideo', 'settings', 'raisehand',
            'videoquality', 'filmstrip', 'invite', 'feedback', 'stats', 'shortcuts',
            'tileview', 'videobackgroundblur', 'download', 'help', 'mute-everyone'
          ],
          SHOW_JITSI_WATERMARK: false,
          DISABLE_JOIN_LEAVE_NOTIFICATIONS: true
        }
      };



      // Check if JitsiMeetExternalAPI is available
      if (typeof JitsiMeetExternalAPI === 'undefined') {
        console.error('Jitsi Meet External API not loaded');
        throw new Error('Jitsi Meet External API not loaded');
      }

      // Create the Jitsi Meet API instance
      this.jitsiMeetApi = new JitsiMeetExternalAPI(domain, options);
      console.log('Jitsi Meet API created successfully:', this.jitsiMeetApi);

      // Add event listeners
      console.log('Adding event listeners to Jitsi Meet API');
      this.jitsiMeetApi.addEventListeners({
        readyToClose: this.handleClose.bind(this),
        videoConferenceJoined: () => {
          console.log('User has joined the conference');
          console.log('Setting loading to false');
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
