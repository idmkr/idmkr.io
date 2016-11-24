<?php namespace Forms;

use Respect\Validation\Validator as v;

class ContactForm extends Form
{
    public function validateMessage()
    {
        return v::length(30,1500);
    }
}