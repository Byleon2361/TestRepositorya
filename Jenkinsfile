pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "nginx:latest"
        DOCKER_REGISTRY = "jenkins.example.localhost"
    }

    stages {
        stage('Клонирование репозитория') {
            steps {
                script {
                    checkout([$class: 'GitSCM', 
                              branches: [[name: '*/main']],
                              userRemoteConfigs: [[url: 'https://github.com/Byleon2361/TestRepositorya']]
                    ])
                }
            }
        }

        stage('Сборка Docker-образа') {
            steps {
                sh "./docker_wrapper.sh $DOCKER_IMAGE $DOCKER_REGISTRY build"
            }
        }

        stage('Публикация в реестр') {
            steps {
                sh "./docker_wrapper.sh $DOCKER_IMAGE $DOCKER_REGISTRY publish"
            }
        }

        stage('Развертывание контейнера') {
            steps {
                sh "./docker_wrapper.sh $DOCKER_IMAGE $DOCKER_REGISTRY deploy"
            }
        }
    }
}
