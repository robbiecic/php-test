## Built & deployed via Jenkins

- Outstanding issue with SSL verfification during docker build running on Jenkins server

## DOCKER COMMAND LINES

- `docker build -t user-app-php .`
- `docker run -it --rm --name my-running-app user-app-php`

## Kubernets deployment commands

- `kubectl create -f manifest.yaml`
- `kubectl expose deployment user-app-php --type="LoadBalancer" --port=80`
- Makes kubenetes cluster available through minikube: `bash minikube service user-app-php`
- Updates deployment: `bash kubectl apply -f manifest.yaml`
- Shows resources available on kubernetes cluster: `kubectl describe node`

## Other hints

- If adding more tests run: `composer dump-autoload`
- To install composer: `composer require --dev phpunit/phpunit ^9`
- To run tests in php & composer: `./vendor/bin/phpunit tests`
