FROM php:7.4-apache

# INSTALL DEPENDENCIES
RUN apt-get update && apt-get install zip unzip ca-certificates -y

# MOVE CONTENTS TO APACHE FOLDER
COPY html/ /var/www/html/
COPY tests/ /var/www/tests/

# INSTALL COMPOSER & MOVE TO BIN DIRECTORY TO BE USED GLOBALLY
RUN cd ~ && curl -sS GET https://getcomposer.org/installer | php
RUN cd ~ && mv composer.phar /usr/local/bin/composer
RUN composer

# SET UP COMPOSER
COPY composer.json /var/www/
RUN cd /var/www/ && composer install && composer require --dev phpunit/phpunit && composer dump-autoload

# WHEN PHP UNIT RUNS IT WANTS TO WRITE IT'S RESULTS HERE
RUN chmod 777 /var/www/vendor/phpunit/phpunit/

# APACHE RUNNING ON PORT 80
EXPOSE 80
