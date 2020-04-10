pipeline {
    agent { dockerfile true }
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
