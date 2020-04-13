pipeline {
    agent {
        dockerfile {
            additionalBuildArgs  '--network=host'
        }
    }
    stages {
        stage('build-validate') {
            steps {
                echo 'Validate image is built properly...'
                sh 'php --version'
            }
        }
        stage('test'){
            steps{
                echo 'Running unit tests ... '
                sh 'php /var/www/vendor/bin/phpunit tests'
            }
        }
    }
}
