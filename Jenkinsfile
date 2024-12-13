pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "nginx:latest"
        DOCKER_REGISTRY = "jenkins.example.localhost"
    }

    stages {
        stage('Очистка рабочего пространства') {
            steps {
                cleanWs()
            }
        }

        stage('Клонирование репозитория') {
            steps {
                git branch: 'main', credentialsId: 'your-credentials-id', url: 'https://github.com/Byleon2361/TestRepositorya.git'
            }
        }

        stage('Подготовка скрипта') {
            steps {
                sh 'test -f ./docker_wrapper.sh || exit 1'
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