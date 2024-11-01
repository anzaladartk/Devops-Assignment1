pipeline {
    agent any 

    environment {
        SONARQUBE_SERVER = 'http://localhost:9000'
        DOCKER_IMAGE = 'my-app-image:latest'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'development', url: 'https://github.com/anzaladartk/Devops-Assignment1.git'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                script {
                    def scannerHome = tool 'sonarscanner'
                    withSonarQubeEnv('Sonarqube') {
                        sh "${scannerHome}/bin/sonar-scanner -X -Dsonar.projectKey=devops-sonarqube -Dsonar.sources=."
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${DOCKER_IMAGE} ."
            }
        }
    }

    post {
        always {
            cleanWs()
        }
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
