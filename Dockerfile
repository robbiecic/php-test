FROM php:7.4-cli
COPY . /src
WORKDIR /src/
CMD [ "php", "./src/index.php" ]
