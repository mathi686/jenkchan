pipeline {
    agent any

    environment {
        DOCKER_REGISTRY = "https://hub.docker.com/repository/docker/ookeymathi/ookeyrepo/general"
        DOCKER_REGISTRY_CREDENTIALS = credentials('dckr_pat_gu0KJH-EfShqPB2MCJgqJQK8Q7c')
        DOCKER_IMAGE_NAME = "httpdko"
        DOCKER_IMAGE_TAG = "latest"
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout your source code from the specified Git URL
                git url: 'https://github.com/mathi686/jenkchan.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build your Docker image using the Dockerfile in your repository
                sh "docker build -t ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} ."
            }
        }

        stage('Push Docker Image') {
            steps {
                // Login to your Docker registry using the provided credentials
                script {
                    docker.withRegistry(DOCKER_REGISTRY, DOCKER_REGISTRY_CREDENTIALS) {
                        // Push the Docker image to the registry
                        sh "docker push ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}"
                    }
                }
            }
        }
    }
}
