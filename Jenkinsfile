// pipeline {
//     agent any 

//     environment {
//         SONARQUBE_SERVER = 'http://localhost:9000'
//         DOCKER_IMAGE = 'my-app-image:latest'
//     }

//     stages {
//         stage('Checkout Code') {
//             steps {
//                 git branch: 'development', url: 'https://github.com/anzaladartk/Devops-Assignment1.git'
//             }
//         }

//         stage('SonarQube Analysis') {
//             steps {
//                 script {
//                     def scannerHome = tool 'sonarscanner'
//                     withSonarQubeEnv('Sonarqube') {
//                         sh "${scannerHome}/bin/sonar-scanner -X -Dsonar.projectKey=devops-sonarqube -Dsonar.sources=. "
//                     }
//                 }
//             }
//         }

//         //  stage('SonarQube Analysis') {
//         //     steps {
//         //         script {
//         //             def scannerHome = tool 'sonarscanner'
//         //             withEnv(["PATH+SONAR=${scannerHome}/bin"]) {
//         //                 sh 'sonar-scanner -Dsonar.projectKey=devops-sonarqube -Dsonar.sources=.'
//         //             }
//         //         }
//         //     }
//         // }

//         stage('Build Docker Image') {
//             steps {
//                 sh "docker build -t ${DOCKER_IMAGE} ."
//             }
//         }
//     }

//     post {
//         always {
//             cleanWs()
//         }
//         success {
//             echo 'Pipeline succeeded!'
//         }
//         failure {
//             echo 'Pipeline failed!'
//         }
//     }
// }

pipeline {
    agent any 

    environment {
        SONARQUBE_SERVER = 'http://localhost:9000'
        DOCKER_IMAGE = 'my-app-image:latest'
        SONAR_TOKEN = 'squ_f2b514353e7e1a1f8683e4aef62757d012ea00ec' // Store your SonarQube token securely
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
                    withEnv(["PATH+SONAR=${scannerHome}/bin", "SONAR_TOKEN=${SONAR_TOKEN}"]) {
                        sh """
                        sonar-scanner \
                          -Dsonar.projectKey=devops-sonarqube \
                          -Dsonar.sources=. \
                          -Dsonar.host.url=${SONARQUBE_SERVER} \
                          -Dsonar.login=${SONAR_TOKEN}
                        """
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
