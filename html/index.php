<?php
require '../vendor/autoload.php';

$userObject = new User('Robert', 'Cicero');
echo 'Hello ' . $userObject->format_name();
