<?php namespace Forms;

use Respect\Validation\Validator as v;

use Idmkr\Formeister\ValidatableForm;
use Idmkr\Formeister\Traits\Mailable;
use Idmkr\Formeister\Traits\Loggable;

abstract class Form extends ValidatableForm
{
    use Mailable,Loggable;

    private $type;

    public function __construct()
    {
        $this->setType();
        $this->setLang('fr_FR');
        $this->setLogDir(dirname(__FILE__)."/received/".$this->getType());
    }

    public function mailOptions()
    {
        return [
            'to' => 'team@idmkr.io',
            'from' => 'robot@idmkr.io',
            'subject' => '{idmkr.io} '.ucfirst($this->getType()).' '.
                $this->input("prenom").' '.$this->input("nom"),
            'smtp' => [
                'host' => 'smtp.mailgun.org',
                'user' => 'postmaster@idmkr.io',
                'password' => '3fd36f6738f30cf55d589c524fd6f410',
                'port' => 587,
            ]
        ];
    }


    /**
     * Validate a form
     *
     * @param array $data
     */
    public function validate($data)
    {
        if(!parent::validate($data))
            return false;

        $mailer = $this->sendMail();

        if(isset($mailer->ErrorInfo))
            $this->setError("Mail", $mailer->ErrorInfo);

        if(!$this->log())
            $this->setError("Log", "There was a problem during log file writing.");

        return !$this->hasErrors();
    }

    public function validatePrenom()
    {
        return $this->text();
    }

    public function validateNom()
    {
        return $this->text();
    }

    public function validateEmail()
    {
        return v::email();
    }

    public function validateTelephone()
    {
        return v::phone()->length(1,100);
    }

    private function text()
    {
        return v::alpha("'\"&,")->length(1,100);
    }

    /**
     * @param string $type
     */
    public function setType()
    {
        $reflect = new \ReflectionClass($this);
        $this->type = strtolower($reflect->getShortName());
    }

    /**
     * @return mixed
     */
    public function getType()
    {
        return $this->type;
    }
}