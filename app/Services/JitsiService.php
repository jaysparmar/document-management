<?php

namespace App\Services;

use Ramsey\Uuid\Uuid;

class JitsiService
{
    /**
     * Generate a unique meeting ID for Jitsi
     *
     * @return string
     */
    public function generateMeetingId()
    {
        return Uuid::uuid4()->toString();
    }

    /**
     * Get the Jitsi domain
     *
     * @return string
     */
    public function getJitsiDomain()
    {
        return config('services.jitsi.domain', 'meet.guifi.net');
    }

    /**
     * Generate a JWT token for Jitsi authentication
     *
     * @param string $userId
     * @param string $userName
     * @param string $userEmail
     * @param string $roomName
     * @return string|null
     */
    public function generateJWT($userId, $userName, $userEmail, $roomName)
    {
        // Check if JWT is enabled in config
        if (!config('services.jitsi.jwt.enabled', false)) {
            return null;
        }

        // If using the public Jitsi server, don't use JWT as it requires specific configuration
        if ($this->getJitsiDomain() === 'meet.guifi.net') {
            return null;
        }

        $key = config('services.jitsi.jwt.key');
        $appId = config('services.jitsi.jwt.app_id');

        if (empty($key) || empty($appId)) {
            return null;
        }

        // Create token payload
        $payload = [
            'iss' => $appId,
            'aud' => $appId,
            'sub' => $this->getJitsiDomain(),
            'exp' => time() + 3600, // Token expires in 1 hour
            'room' => $roomName,
            'context' => [
                'user' => [
                    'id' => $userId,
                    'name' => $userName,
                    'email' => $userEmail,
                    'moderator' => true,
                    'affiliation' => 'owner'
                ],
                'features' => [
                    'livestreaming' => true,
                    'recording' => true,
                    'outbound-call' => true,
                    'transcription' => true,
                    'screen-sharing' => true
                ]
            ]
        ];

        // Generate JWT token
        try {
            return \Firebase\JWT\JWT::encode($payload, $key, 'HS256');
        } catch (\Exception $e) {
            \Log::error('Failed to generate Jitsi JWT: ' . $e->getMessage());
            return null;
        }
    }

    /**
     * Get the configuration for a Jitsi meeting
     *
     * @param string $meetingId
     * @param string $roomName
     * @param string $displayName
     * @param array $options
     * @return array
     */
    public function getMeetingConfig($meetingId, $roomName, $displayName, $options = [])
    {
        $domain = $this->getJitsiDomain();

        $config = [
            'domain' => $domain,
            'roomName' => $meetingId,
            'displayName' => $displayName,
            // Add server-side configuration to ensure the authenticated user is set as a moderator
            'startWithVideoMuted' => false,
            'startWithAudioMuted' => false,
            'startWithModeratorApproval' => false,
            'requireModeratorEnabled' => false,
            'moderatorRoles' => ['owner'],
            'startSilent' => false,
            'enableLobby' => false,
            'moderatorPW' => '',
            'userRole' => 'moderator',
        ];

        // Add JWT token if user info is provided
        if (isset($options['userId']) && isset($options['email'])) {
            $jwt = $this->generateJWT(
                $options['userId'],
                $displayName,
                $options['email'],
                $meetingId
            );

            if ($jwt) {
                $config['jwt'] = $jwt;
            }
        }

        // Add additional options
        if (!empty($options)) {
            $config = array_merge($config, $options);
        }

        return $config;
    }

}
