<?php
declare(strict_types=1);

class User
{
    public $first_name;
    public $surname;
    public $formatted_name;

    public function __construct(string $first_name, string $surname)
    {
        $this->first_name = $first_name;
        $this->surname = $surname;
    }

    public function format_name():string
    {
        $this->formatted_name = $this->first_name . ' ' . $this->surname;
        return($this->formatted_name);
    }

    public function validate_name():bool
    {
        //A name can have maximum of 255 characters
        if (strlen($this->first_name) > 255) {
            return false;
        } elseif (strlen($this->surname) > 255) {
            return false;
        //Name can only contain valid characters
        } elseif (preg_match('/[^A-Za-z ]/', $this->first_name) == 1) {
            return false;
        } elseif (preg_match('/[^A-Za-z ]/', $this->surname) == 1) {
            return false;
        } else {
            return true; //valid
        }
    }
};
