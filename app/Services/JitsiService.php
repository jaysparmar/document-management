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
        return config('services.jitsi.domain', 'meet.jit.si');
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
            'appId' => config('services.jitsi.app_id', ''),
            'appSecret' => config('services.jitsi.app_secret', ''),
        ];

        // Add additional options
        if (!empty($options)) {
            $config = array_merge($config, $options);
        }

        return $config;
    }

    /**
     * Generate a JWT token for secure Jitsi meetings (if using a private Jitsi instance)
     *
     * @param string $meetingId
     * @param string $displayName
     * @param string $email
     * @param int $expiresIn
     * @return string|null
     */
    public function generateJWT($meetingId, $displayName, $email, $expiresIn = 3600)
    {
        $appId = config('services.jitsi.app_id');
        $appSecret = config('services.jitsi.app_secret');

        // Only generate JWT if app ID and secret are configured
        if (empty($appId) || empty($appSecret)) {
            return null;
        }

        $payload = [
            'iss' => $appId,
            'aud' => 'jitsi',
            'exp' => time() + $expiresIn,
            'nbf' => time(),
            'sub' => $this->getJitsiDomain(),
            'context' => [
                'user' => [
                    'name' => $displayName,
                    'email' => $email,
                ],
            ],
            'room' => $meetingId,
        ];

        // This is a placeholder - in a real implementation, you would use a JWT library
        // For example: return \Firebase\JWT\JWT::encode($payload, $appSecret, 'HS256');

        // For now, we'll return null as we're not implementing the actual JWT generation
        return null;
    }
}
