FROM php:7.3-apache

# INSTALL DEPENDENCIES
RUN apt-get update && apt-get install zip unzip

# MOVE CONTENTS TO APACHE FOLDER
COPY html/ /var/www/html/
COPY tests/ /var/www/tests/
# COPY vendor/ /var/www/vendor/ this folder is created by composer install

# INSTALL COMPOSER & MOVE TO BIN DIRECTORY TO BE USED GLOBALLY
RUN cd ~ && curl -s https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

# RUN COMPOSER
COPY composer.json /var/www/
RUN cd /var/www/ && composer install && composer require --dev phpunit/phpunit && composer dump-autoload

# CHECK INSTALLATION
# RUN ls /var/www
# RUN ls /var/www/html
# RUN ls /var/www/tests
# RUN ls /var/www/vendor
