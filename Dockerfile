FROM php:7.4-apache

# INSTALL DEPENDENCIES
RUN apt-get update && apt-get install zip unzip ca-certificates -y

# MOVE CONTENTS TO APACHE FOLDER
COPY html/ /var/www/html/
COPY tests/ /var/www/tests/
# COPY vendor/ /var/www/vendor/ this folder is created by composer install


# I think I need to copy my SSL cert into /etc/ssl
# COPY certs/cacert.pem /etc/ssl/certs/

# DOWNLOAD LATEST CURL PERM
# RUN curl -sS GET https://curl.haxx.se/ca/cacert.pem --output /etc/ssl/certs/

RUN openssl s_client -connect getcomposer.org:443

# INSTALL COMPOSER & MOVE TO BIN DIRECTORY TO BE USED GLOBALLY
# RUN cd ~ && curl -sS GET https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
RUN cd ~ && curl -sS GET https://getcomposer.org/installer && mv composer.phar /usr/local/bin/composer
RUN composer
# RUN openssl version

# RUN COMPOSER
# COPY composer.json /var/www/
# RUN cd /var/www/ && composer install && composer require --dev phpunit/phpunit && composer dump-autoload

# CHECK INSTALLATION
# RUN ls /var/www
# RUN ls /var/www/html
# RUN ls /var/www/tests
# RUN ls /var/www/vendor
