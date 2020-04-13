FROM php:7.4-apache

# INSTALL DEPENDENCIES
RUN apt-get update && apt-get install zip unzip ca-certificates

# MOVE CONTENTS TO APACHE FOLDER
COPY html/ /var/www/html/
COPY tests/ /var/www/tests/

# I think I need to append my self-signed SSL cert into /etc/ssl/certs/ca-certificates.crt
COPY certs/ca-certificates.crt /usr/local/share/ca-certificates
RUN mkdir /usr/local/getcomposer
RUN echo -n | openssl s_client -connect getcomposer.org:443 | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > /usr/local/getcomposer/cacert.cert
RUN mv /usr/local/getcomposer/cacert.cert /usr/local/share/ca-certificates
RUN update-ca-certificates

# INSTALL COMPOSER & MOVE TO BIN DIRECTORY TO BE USED GLOBALLY
RUN cd ~ && curl --header "Host: localhost" -sS GET https://getcomposer.org/installer | php
RUN cd ~ && mv composer.phar /usr/local/bin/composer
RUN composer
COPY composer.json /var/www/
RUN cd /var/www/ && composer install && composer require --dev phpunit/phpunit && composer dump-autoload

#EXPOSE 80

#
# ARCHIVED COMMANDS
#

# RUN cd ~ && curl tlsv1 -sSk GET https://getcomposer.org/installer | php RUN mv composer.phar /usr/local/bin/composer

# CHECK INSTALLATION
# RUN ls /var/www
# RUN ls /var/www/html
# RUN ls /var/www/tests
# RUN ls /var/www/vendor
