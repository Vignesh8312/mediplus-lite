pipeline {
    agent any

    environment {
        DOCKER_USER = 'vignesh997' // MUST match your Docker Hub username
        IMAGE_NAME = "${DOCKER_USER}/mediplus-lite"
    }

    stages {
        stage('Build & Push') {
            steps {
                script {
                    // First verify local Docker access
                    sh 'docker ps >/dev/null'
                    
                    withDockerRegistry(
                        credentialsId: 'docker-creds', 
                        url: 'https://index.docker.io/v1/'
                    ) {
                        sh """
                        docker build -t ${IMAGE_NAME}:latest .
                        docker push ${IMAGE_NAME}:latest
                        """
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                sh """
                docker run -d \
                    --name mediplus-container \
                    -p 80:80 \
                    ${IMAGE_NAME}:latest
                """
            }
        }
    }
}