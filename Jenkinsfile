pipeline {
    agent {
        dockerfile {
            filename 'Dockerfile'
            additionalBuildArgs  '–-network=host'
            reuseNode true
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
