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
        this.getJitsiInfo();
      } else {
        this.router.navigate(['/meetings']);
      }
    });
  }

  loadJitsiScript(domain: string) {
    if (this.jitsiApiLoaded) {
      return Promise.resolve();
    }

    this.loading = true;
    return new Promise<void>((resolve, reject) => {
      const script = document.createElement('script');
      script.src = `https://${domain}/external_api.js`;
      script.async = true;
      script.onload = () => {
        console.log(`Jitsi script loaded from ${domain}`);
        this.jitsiApiLoaded = true;
        resolve();
      };
      script.onerror = (error) => {
        console.error(`Error loading Jitsi script from ${domain}:`, error);
        this.toastrService.error(this.translateService.instant('ERROR_LOADING_JITSI'));
        this.loading = false;
        reject(error);
      };
      document.body.appendChild(script);
    });
  }

  getJitsiInfo() {
    this.loading = true;
    this.sub$.sink = this.meetingService.getJitsiInfo(this.meetingId)
      .subscribe(
        (response: any) => {
          console.log('Jitsi Info Response:', response);

          // Get the domain from the response
          const jitsiConfig = response.jitsiConfig || {};
          const domain = jitsiConfig.domain || 'meet.jit.si';

          // Load the script from the correct domain
          this.loadJitsiScript(domain)
            .then(() => {
              // Initialize Jitsi after script is loaded
              this.initializeJitsiMeet(response);
            })
            .catch((error) => {
              console.error('Failed to load Jitsi script:', error);
              this.toastrService.error(this.translateService.instant('ERROR_LOADING_JITSI'));
              this.loading = false;
              this.router.navigate(['/meetings']);
            });
        },
        (error) => {
          console.error('Error getting Jitsi info:', error);
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

      // Log detailed structure of meetingInfo
      console.log('Meeting ID:', meetingInfo.meeting_id);
      console.log('Room Name:', meetingInfo.room_name);
      console.log('Display Name:', meetingInfo.display_name);
      console.log('Start Time:', meetingInfo.start_time);
      console.log('End Time:', meetingInfo.end_time);
      console.log('Jitsi Config:', meetingInfo.jitsiConfig);

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
      const jwt = jitsiConfig.jwt || null;

      // Debug: Log JWT token and domain
      console.log('Jitsi Domain:', domain);
      console.log('JWT Token:', jwt ? 'Token exists' : 'No token');
      if (jwt) {
        // Log the first few characters of the token for debugging (don't log the full token for security)
        console.log('JWT Token (first 10 chars):', jwt.substring(0, 10) + '...');
      } else {
        console.warn('No JWT token provided. This may cause authentication issues with Jitsi.');
        this.toastrService.warning(this.translateService.instant('WARNING_NO_JWT_TOKEN'));
      }

      const options = {
        roomName: meetingInfo.meetingId,
        width: '100%',
        height: '100%',
        parentNode: this.jitsiContainer,
        jwt: jwt, // Add JWT token for authentication
        userInfo: {
          displayName: meetingInfo.displayName,
          // Use optional chaining and provide a default empty string if email is undefined
          email: jitsiConfig.email || ''
        },
        configOverwrite: {
          defaultLanguage: 'en',
          startWithAudioMuted: false,
          startWithVideoMuted: false,
          prejoinPageEnabled: false,
          disableInitialGUM: false,
          enableWelcomePage: false,
          enableClosePage: false,
          // Security settings
          security: {
            enableInsecureRoomNameWarning: false,
            roomPasswordRequired: false
          },
          // Explicitly disable password
          lockRoomGuestEnabled: false,
          hideLobbyButton: true,
          // Set the room as public and allow any connection type
          p2p: {
            enabled: false
          },

          // Disable waiting for host
          startAudioOnly: false,
          startVideoOnly: false,
          // Disable waiting for moderator
          startSilent: false,
          // Disable lobby and other features that might prevent users from joining
          enableLobby: false,
          requireDisplayName: false,
          disableDeepLinking: true,
          // Ensure JWT is used for authentication but don't require it
          tokenAuthUrl: null,
          // Disable authentication requirements
          disableProfile: true,
          doNotStoreRoom: false,
          // Allow guests
          enableNoisyMicDetection: false,
          // Enable user roles based on token
          enableUserRolesBasedOnToken: true,
          enableFeaturesBasedOnToken: true,
          // Disable token requirements
          disableThirdPartyRequests: true,
          disableLocalVideoFlip: true,
          // Set authenticated domain
          // anonymousdomain: 'guest.meet.jit.si', // Remove this line as it might cause issues
          enableDisplayNameInStats: false,
          // Allow any domain
          domainCheck: false,
          enableEmailInStats: false,
          // Set as conference room
          channelLastN: -1,
          startWithJitsiMeetTokenAuth: true,
          // Set moderator settings
          requireModeratorEnabled: false,
          autoKnockLobby: true,
          // Enable moderator indicator
          disableModeratorIndicator: false,
          // Disable feature requirements
          disableFocusIndicator: true,
          disableJoinLeaveSounds: true,
          disableRecordAudioNotification: true,
          // Disable permission requirements
          disableAudioLevels: true,
          disableSelfView: false,
          disableSelfViewSettings: true,
          // Set the user as a moderator
          testing: {
            enableFirestoreLogging: false
          }
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
