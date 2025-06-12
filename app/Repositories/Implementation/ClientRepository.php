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
                    <h2>Bienvenue sur ' . config('app.name') . '</h2>
                </div>
                <div class="content">
                    <p>Bonjour ' . $client->contactPerson . ',</p>

                    <p>Votre compte a été créé avec succès. Voici vos identifiants de connexion :</p>

                    <div class="credentials">
                        <p><strong>Email :</strong> ' . $client->email . '</p>
                        <p><strong>Mot de passe :</strong> ' . $password . '</p>
                    </div>

                    <p>Merci de conserver ces informations en lieu sûr. Nous vous recommandons de changer votre mot de passe lors de votre première connexion.</p>

                    <p>Vous pouvez accéder à votre compte en cliquant sur le bouton ci-dessous :</p>

                    <a href="' . $loginUrl . '" class="btn">Se connecter à votre compte</a>

                    <p>Si vous avez des questions ou besoin d’aide, n’hésitez pas à nous contacter.</p>

                    <p>Merci d’avoir choisi nos services !</p>

                    <p>Cordialement,<br>L’équipe ' . config('app.name') . '</p>
                </div>
                <div class="footer">
                    <p>Ceci est un e-mail automatique. Merci de ne pas répondre à ce message.</p>
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
