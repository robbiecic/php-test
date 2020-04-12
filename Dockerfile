FROM php:7.4-apache

# INSTALL DEPENDENCIES
RUN apt-get update && apt-get install zip unzip ca-certificates -y

# MOVE CONTENTS TO APACHE FOLDER
COPY html/ /var/www/html/
COPY tests/ /var/www/tests/
# COPY vendor/ /var/www/vendor/ this folder is created by composer install


# I think I need to append my self-signed SSL cert into /etc/ssl/certs/ca-certificates.crt
COPY certs/ /usr/local/certs/
RUN cat /usr/local/certs/ca-certificates.crt >> /etc/ssl/certs/ca-certificates.crt
RUN cat /etc/ssl/certs/ca-certificates.crt
RUN update-ca-certificates

# INSTALL COMPOSER & MOVE TO BIN DIRECTORY TO BE USED GLOBALLY
# RUN cd ~ && curl -sS GET https://getcomposer.org/installer | php RUN mv composer.phar /usr/local/bin/composer

RUN cd ~ && curl -sS GET https://getcomposer.org/installer | php
RUN cd ~ && mv composer.phar /usr/local/bin/composer
RUN composer

# COPY composer.json /var/www/
# RUN cd /var/www/ && composer install && composer require --dev phpunit/phpunit && composer dump-autoload

# CHECK INSTALLATION
# RUN ls /var/www
# RUN ls /var/www/html
# RUN ls /var/www/tests
# RUN ls /var/www/vendor
