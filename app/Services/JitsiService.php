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
        ];

        // Add additional options
        if (!empty($options)) {
            $config = array_merge($config, $options);
        }

        return $config;
    }

}
