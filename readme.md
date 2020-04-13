## Built & deployed via Jenkins

- Outstanding issue with SSL verfification during docker build running on Jenkins server

## DOCKER COMMAND LINES

- docker build -t user-app-php .
- docker run -it --rm --name my-running-app user-app-php

## Kubernets deployment commands

- kubectl create -f manifest.yaml
- kubectl expose deployment user-app-php --type="LoadBalancer" --port=80
- minikube service user-app-php

## Other hints

- If adding more tests run: `php composer dump-autoload`
- To install composer: `php composer require --dev phpunit/phpunit ^9`
- To run tests in php & composer: `php ./vendor/bin/phpunit tests`
