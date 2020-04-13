pipeline {
    agent {
        dockerfile {
            additionalBuildArgs  '--network=host'
        }
    }
    stages {
        stage('build') {
            steps {
                sh 'php --version'
            }
        }
        stage('test'){
            steps{
                sh 'php /var/www/vendor/bin/phpunit tests'
            }
        }
    }
}
