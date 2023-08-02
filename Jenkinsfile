pipeline {
    agent any

    environment {
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
                withCredentials([string(credentialsId: 'ecb23d14-9582-4e13-b449-7bc2da80e6a9', variable: 'DOCKER_TOKEN')]) {
                    script {
                        docker.withRegistry("https://index.docker.io/v1/", 'token', DOCKER_TOKEN) {
                            docker.image("${DOCKER_IMAGE_NAME}:${GIT_BRANCH}").push()
                        }
                    }
                }
            }
        }
    }
}
