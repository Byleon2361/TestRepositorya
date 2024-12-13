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
