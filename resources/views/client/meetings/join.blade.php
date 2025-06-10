@extends('client.layouts.app')

@section('title', $meeting->title)

@section('content')
<div class="container-fluid py-4">
    <!-- Meeting Header Card -->
    <div class="card mb-4">
        <div class="card-body">
            <div class="row align-items-center">
                <div class="col-auto">
                    <div class="icon bg-gradient-primary rounded-circle d-flex align-items-center justify-content-center text-white shadow"
                        style="width: 48px; height: 48px;">
                        <i class="fas fa-video"></i>
                    </div>
                </div>
                <div class="col-md-6">
                    <h5 class="mb-0">{{ $meeting->title }}</h5>
                    <p class="text-muted mb-0 text-sm">
                        <i class="fas fa-user me-1"></i> Created by: {{ $meeting->creator->firstName ?? '' }} {{ $meeting->creator->lastName ?? '' }}
                    </p>
                </div>
                <div class="col-md-4 text-md-end">
                    <button id="leave-meeting-btn" class="btn btn-danger">
                        <i class="fas fa-phone-slash me-2"></i>Leave Meeting
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Jitsi Container -->
    <div class="card">
        <div class="card-body">
            <div id="loading-indicator" class="text-center p-5">
                <div class="spinner-border text-primary" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
                <p class="mt-2">Joining meeting...</p>
            </div>
            <div id="jitsi-container" style="width: 100%; height: 600px;"></div>
        </div>
    </div>
</div>
@endsection

@push('scripts')
<script>
    let jitsiMeetApi = null;
    let jitsiApiLoaded = false;

    // Function to load Jitsi script
    function loadJitsiScript(domain) {
        if (jitsiApiLoaded) {
            return Promise.resolve();
        }

        return new Promise((resolve, reject) => {
            const script = document.createElement('script');
            script.src = `https://${domain}/external_api.js`;
            script.async = true;
            script.onload = () => {
                console.log(`Jitsi script loaded from ${domain}`);
                jitsiApiLoaded = true;
                resolve();
            };
            script.onerror = (error) => {
                console.error(`Error loading Jitsi script from ${domain}:`, error);
                alert('Error loading meeting. Please try again later.');
                reject(error);
            };
            document.body.appendChild(script);
        });
    }

    // Function to get Jitsi info
    function getJitsiInfo() {
        fetch('{{ route("client-portal.meetings.jitsi", $meeting->id) }}')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                console.log('Jitsi Info Response:', data);

                // Get the domain from the response
                const jitsiConfig = data.jitsiConfig || {};
                const domain = jitsiConfig.domain || 'meet.guifi.net';

                // Load the script from the correct domain
                loadJitsiScript(domain)
                    .then(() => {
                        // Initialize Jitsi after script is loaded
                        initializeJitsiMeet(data);
                    })
                    .catch(error => {
                        console.error('Failed to load Jitsi script:', error);
                        document.getElementById('loading-indicator').innerHTML = '<div class="alert alert-danger">Failed to load meeting. Please try again later.</div>';
                    });
            })
            .catch(error => {
                console.error('Error getting Jitsi info:', error);
                document.getElementById('loading-indicator').innerHTML = '<div class="alert alert-danger">Failed to get meeting information. Please try again later.</div>';
            });
    }

    // Function to initialize Jitsi Meet
    function initializeJitsiMeet(meetingInfo) {
        try {
            // Debug: Log the meetingInfo object to see its structure
            console.log('Meeting Info:', meetingInfo);

            const jitsiContainer = document.getElementById('jitsi-container');

            if (!jitsiContainer) {
                throw new Error('Jitsi container element not found');
            }

            // Ensure jitsiConfig exists
            const jitsiConfig = meetingInfo.jitsiConfig || {};
            const domain = jitsiConfig.domain || 'meet.guifi.net';
            const jwt = jitsiConfig.jwt || null;

            const options = {
                roomName: meetingInfo.meetingId,
                width: '100%',
                height: '100%',
                parentNode: jitsiContainer,

                configOverwrite: {
                    defaultLanguage: 'en',
                    startWithAudioMuted: false,
                    startWithVideoMuted: false,

                    disableInitialGUM: false,
                    enableWelcomePage: false,
                    enableClosePage: false,
                    security: {
                        enableInsecureRoomNameWarning: false,
                        roomPasswordRequired: false
                    },
                    lockRoomGuestEnabled: false,
                    hideLobbyButton: true,
                    p2p: {
                        enabled: false
                    },
                    startAudioOnly: false,
                    startVideoOnly: false,
                    startSilent: false,
                    startWithModeratorApproval: false,
                    prejoinConfig: {
                        enabled: false
                    },
                    moderatorRoles: ['owner'],
                    moderatorPW: '',
                    enableLobby: false,
                    requireDisplayName: false,
                    disableDeepLinking: true,
                    tokenAuthUrl: null,
                    disableProfile: true,
                    doNotStoreRoom: false,
                    enableNoisyMicDetection: false,
                    enableUserRolesBasedOnToken: true,
                    enableFeaturesBasedOnToken: true,
                    startAsGuest: false,
                    disableThirdPartyRequests: true,
                    disableLocalVideoFlip: true,
                    enableDisplayNameInStats: false,
                    domainCheck: false,
                    enableEmailInStats: false,
                    channelLastN: -1,
                    requireModeratorEnabled: false,
                    autoKnockLobby: true,
                    disableModeratorIndicator: false,
                    disableFocusIndicator: true,
                    disableJoinLeaveSounds: true,
                    disableRecordAudioNotification: true,
                    disableAudioLevels: true,
                    disableSelfView: false,
                    disableSelfViewSettings: true,
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
            jitsiMeetApi = new JitsiMeetExternalAPI(domain, options);
            console.log('Jitsi Meet API created successfully:', jitsiMeetApi);

            // Hide loading indicator
            document.getElementById('loading-indicator').style.display = 'none';

            // Add event listeners
            jitsiMeetApi.addEventListeners({
                readyToClose: handleClose,
                videoConferenceJoined: () => {
                    console.log('User has joined the conference');
                },
                videoConferenceLeft: () => {
                    console.log('User has left the conference');
                    handleClose();
                },
                error: (error) => {
                    console.error('Jitsi Meet Error:', error);
                    alert('Error in meeting. Please try again later.');
                }
            });

            // Add leave meeting button event listener
            document.getElementById('leave-meeting-btn').addEventListener('click', leaveMeeting);
        } catch (error) {
            console.error('Error initializing Jitsi Meet:', error);
            document.getElementById('loading-indicator').innerHTML = '<div class="alert alert-danger">Failed to initialize meeting. Please try again later.</div>';
        }
    }

    // Function to handle closing the meeting
    function handleClose() {
        if (jitsiMeetApi) {
            jitsiMeetApi.dispose();
        }
        window.location.href = '{{ route("client-portal.meetings.index") }}';
    }

    // Function to leave the meeting
    function leaveMeeting() {
        if (jitsiMeetApi) {
            jitsiMeetApi.executeCommand('hangup');
        }
        window.location.href = '{{ route("client-portal.meetings.index") }}';
    }

    // Initialize when the page loads
    document.addEventListener('DOMContentLoaded', function() {
        getJitsiInfo();
    });
</script>
@endpush
