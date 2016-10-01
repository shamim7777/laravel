<?php

namespace App\Mail;

use App\User;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class FusionMail extends Mailable
{
    use Queueable, SerializesModels;


   /**
     * The user instance.
     *
     * @var User
     */
    public $user;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct(User $user)
    {
        $this->user = $user;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
 
    public function build()
    {
        $address = 'shamim7777@gmail.com';
        $name = 'Shamim Ahmed';
        $subject = 'Welcome to PixelFusion';



        return $this->view('emails.fusionview')
                    ->from($address, $name)
                    ->cc($address, $name)
                    ->bcc($address, $name)
                    ->replyTo($address, $name)
                    ->subject($subject)
                    ->with([
                        'name' => $this->user->first_name.' '.$this->user->last_name,
                        'verification_code' => $this->user->verification_code,
                    ]);;
    }
}
