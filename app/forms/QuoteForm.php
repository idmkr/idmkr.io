<?php namespace Forms;

use Respect\Validation\Validator as v;

class QuoteForm extends Form
{
    public function validateDenomination()
    {
        return v::length(10,1500);
    }

    public function validateType()
    {
        return v::stringType();
    }

    public function validateDescription()
    {
        return v::length(30,1500);
    }

    public function validateFeatures()
    {
        return v::arrayType();
    }

    
}