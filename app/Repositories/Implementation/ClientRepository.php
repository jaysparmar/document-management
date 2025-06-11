<?php

namespace App\Repositories\Implementation;

use App\Models\Clients;
use App\Repositories\Implementation\BaseRepository;
use App\Repositories\Contracts\ClientRepositoryInterface;
use App\Repositories\Contracts\EmailRepositoryInterface;
use Illuminate\Support\Facades\URL;

//use Your Model

/**
 * Class ActionsRepository.
 */
class ClientRepository extends BaseRepository implements ClientRepositoryInterface
{
    /**
     * @var Model
     */
    protected $model;

    /**
     * @var EmailRepositoryInterface
     */
    protected $emailRepository;

    /**
     * ClientRepository constructor.
     *
     * @param EmailRepositoryInterface $emailRepository
     */
    public function __construct(EmailRepositoryInterface $emailRepository)
    {
        parent::__construct();
        $this->emailRepository = $emailRepository;
    }

    /**
     * Specify Model class name
     *
     * @return string
     */
    public static function model()
    {
        return Clients::class;
    }

    /**
     * Save a new entity in repository and send welcome email
     *
     * @param array $attributes
     *
     * @return \Illuminate\Database\Eloquent\Model
     */
    public function create(array $attributes)
    {
        // Create the client using the parent method
        $client = parent::create($attributes);

        // Send welcome email with login credentials
        $this->sendWelcomeEmail($client, $attributes['password']);

        return $client;
    }

    /**
     * Send welcome email to new client
     *
     * @param \App\Models\Clients $client
     * @param string $password
     *
     * @return void
     */
    protected function sendWelcomeEmail($client, $password)
    {
        // Generate login URL
        $loginUrl = route('client-portal.login');

        // Create email content
        $subject = 'Welcome to ' . config('app.name') . ' - Your Account Details';

        // Create HTML email template
        $message = '
        <html>
        <head>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    line-height: 1.6;
                    color: #333;
                }
                .container {
                    max-width: 600px;
                    margin: 0 auto;
                    padding: 20px;
                    border: 1px solid #ddd;
                    border-radius: 5px;
                }
                .header {
                    background-color: #f8f9fa;
                    padding: 15px;
                    text-align: center;
                    border-radius: 5px 5px 0 0;
                }
                .content {
                    padding: 20px;
                }
                .footer {
                    background-color: #f8f9fa;
                    padding: 15px;
                    text-align: center;
                    border-radius: 0 0 5px 5px;
                    font-size: 12px;
                }
                .btn {
                    display: inline-block;
                    padding: 10px 20px;
                    background-color: #007bff;
                    color: white;
                    text-decoration: none;
                    border-radius: 5px;
                    margin: 20px 0;
                }
                .credentials {
                    background-color: #f8f9fa;
                    padding: 15px;
                    border-radius: 5px;
                    margin: 20px 0;
                }
            </style>
        </head>
        <body>
            <div class="container">
                <div class="header">
                    <h2>Welcome to ' . config('app.name') . '</h2>
                </div>
                <div class="content">
                    <p>Dear ' . $client->contactPerson . ',</p>

                    <p>Your account has been created successfully. Below are your login credentials:</p>

                    <div class="credentials">
                        <p><strong>Email:</strong> ' . $client->email . '</p>
                        <p><strong>Password:</strong> ' . $password . '</p>
                    </div>

                    <p>Please keep this information secure. We recommend changing your password after your first login.</p>

                    <p>You can access your account by clicking the button below:</p>

                    <a href="' . $loginUrl . '" class="btn">Login to Your Account</a>

                    <p>If you have any questions or need assistance, please don\'t hesitate to contact us.</p>

                    <p>Thank you for choosing our services!</p>

                    <p>Best regards,<br>The ' . config('app.name') . ' Team</p>
                </div>
                <div class="footer">
                    <p>This is an automated email. Please do not reply to this message.</p>
                </div>
            </div>
        </body>
        </html>';

        // Prepare email data
        $emailData = [
            'to_address' => $client->email,
            'subject' => $subject,
            'message' => $message,
            'path' => null,
            'location' => null,
            'doc_url' => null,
            'file_name' => null
        ];

        // Send the email
        try {
            $this->emailRepository->sendEmail($emailData);
        } catch (\Exception $e) {
            // Log the error but don't prevent client creation
            \Log::error('Failed to send welcome email to client: ' . $e->getMessage());
        }
    }
}
