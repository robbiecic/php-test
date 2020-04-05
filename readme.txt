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


DOCKER COMMAND LINES
docker build -t user-app-php .
docker run -it --rm --name my-running-app user-app-php


<h3>Built & deployed via Jenkins      </h3>
