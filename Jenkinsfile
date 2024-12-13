pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "nginx:latest"
        DOCKER_REGISTRY = "jenkins.example.localhost"
    }

    stages {
        stage('Клонирование репозитория') {
            steps {

                sh 'git clone https://github.com/Byleon2361/TestRepositorya.git'

            }
        }

        stage('Подготовка скрипта') {
            steps {
                sh 'chmod +x ./docker_wrapper.sh'
            }
        }

        stage('Сборка Docker-образа') {
            steps {
                sh "bash ./docker_wrapper.sh $DOCKER_IMAGE $DOCKER_REGISTRY build"
            }
        }

        stage('Публикация в реестр') {
            steps {
                sh "bash ./docker_wrapper.sh $DOCKER_IMAGE $DOCKER_REGISTRY publish"
            }
        }

        stage('Развертывание контейнера') {
            steps {
                sh "bash ./docker_wrapper.sh $DOCKER_IMAGE $DOCKER_REGISTRY deploy"
            }
        }
    }
}
