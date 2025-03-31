pipeline {
    agent any 

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/Vignesh8312/mediplus-lite.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("vignesh8312/mediplus-lite:latest")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh '''
                    docker stop mediplus-container || true
                    docker rm mediplus-container || true
                    docker run -d --name mediplus-container -p 80:80 vignesh8312/mediplus-lite:latest
                    '''
                }
            }
        }
    }
}
