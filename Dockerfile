FROM php:7.4-apache

# INSTALL DEPENDENCIES
RUN apt-get update && apt-get install zip unzip

# MOVE CONTENTS TO APACHE FOLDER
COPY html/ /var/www/html/
COPY tests/ /var/www/tests/
# COPY vendor/ /var/www/vendor/ this folder is created by composer install

# INSTALL COMPOSER & MOVE TO BIN DIRECTORY TO BE USED GLOBALLY
RUN cd ~ && openssl s_client -showcerts -servername getcomposer.org -connect getcomposer.org:443 > cacert.pem
RUN cd ~ && curl -sS https://getcomposer.org/installer --cacert cacert.pem | php
RUN cd ~ && mv composer.phar /usr/local/bin/composer
RUN composer


# RUN COMPOSER
COPY composer.json /var/www/
RUN cd /var/www/ && composer install && composer require --dev phpunit/phpunit && composer dump-autoload

# CHECK INSTALLATION
# RUN ls /var/www
# RUN ls /var/www/html
# RUN ls /var/www/tests
# RUN ls /var/www/vendor
