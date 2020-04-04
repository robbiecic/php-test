To install composer
composer require --dev phpunit/phpunit ^9

To run tests
./vendor/bin/phpunit tests

Composer.json
{
  "autoload": {
    "classmap": [
      "src/"
    ]
  },
  "require-dev": {
    "phpunit/phpunit": "^9"
  }
}


If adding more tests run this
composer dump-autoload
