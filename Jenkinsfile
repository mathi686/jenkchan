pipeline {
    agent any

    environment {
        DOCKER_HUB_USERNAME = credentials('ookeymathi') ?: ''
        DOCKER_HUB_PASSWORD = credentials('MathiDocker@123') ?: ''
        DOCKER_IMAGE_NAME = 'ookeymathi/newhttpd'
        GIT_REPO_URL = 'https://github.com/mathi686/jenkchan.git'
        GIT_BRANCH = 'main' // Replace 'main' with the branch you want to build
    }

    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM',
                          branches: [[name: "${GIT_BRANCH}"]],
                          doGenerateSubmoduleConfigurations: false,
                          extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'source-code']],
                          submoduleCfg: [],
                          userRemoteConfigs: [[url: "${GIT_REPO_URL}"]]])
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE_NAME}:${GIT_BRANCH}", "./source-code")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker-hub-credentials', url: '') {
                        docker.withRegistry("https://index.docker.io/v1/", "${DOCKER_HUB_USERNAME}", "${DOCKER_HUB_PASSWORD}") {
                            docker.image("${DOCKER_IMAGE_NAME}:${GIT_BRANCH}").push()
                        }
                    }
                }
            }
        }
    }
}
