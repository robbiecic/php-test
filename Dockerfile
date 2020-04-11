FROM php:7.3-apache

# INSTALL DEPENDENCIES
RUN apt-get update && apt-get install zip unzip

# MOVE CONTENTS TO APACHE FOLDER
COPY html/ /var/www/html/
COPY tests/ /var/www/tests/
# COPY vendor/ /var/www/vendor/ this folder is created by composer install

# INSTALL COMPOSER & MOVE TO BIN DIRECTORY TO BE USED GLOBALLY
#RUN cd ~ && curl -s https://getcomposer.org/installer | php
#RUN cd ~ && mv composer.phar /usr/local/bin/composer
#RUN curl -k https://getcomposer.org/installer --insecure | php -- --install-dir=/usr/local/bin --filename=composer
#RUN composer

RUN cd ~ && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN cd ~ && php -r "if (hash_file('sha384', 'composer-setup.php') === 'e0012edf3e80b6978849f5eff0d4b4e4c79ff1609dd1e613307e16318854d24ae64f26d17af3ef0bf7cfb710ca74755a') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN cd ~ && php composer-setup.php
RUN cd ~ && php -r "unlink('composer-setup.php');"
RUN cd ~ && mv composer.phar /usr/local/bin/composer

# RUN COMPOSER
COPY composer.json /var/www/
RUN cd /var/www/ && composer install && composer require --dev phpunit/phpunit && composer dump-autoload

# CHECK INSTALLATION
# RUN ls /var/www
# RUN ls /var/www/html
# RUN ls /var/www/tests
# RUN ls /var/www/vendor
