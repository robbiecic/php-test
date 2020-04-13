pipeline {
    agent {
        dockerfile {
            filename 'Dockerfile'
            additionalBuildArgs '–network=host'
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
                sh 'php ./vendor/bin/phpunit tests'
            }
        }
    }
}
