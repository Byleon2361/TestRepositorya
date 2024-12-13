pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "my-app:latest"
        DOCKER_REGISTRY = "registry.example.localhost"
    }

    stages {
        stage('Clone repository') {
            steps {
                git 'https://github.com/Byleon2361/TestRepositorya'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Push to Registry') {
            steps {
                sh 'docker tag $DOCKER_IMAGE $DOCKER_REGISTRY/$DOCKER_IMAGE'
                sh 'docker push $DOCKER_REGISTRY/$DOCKER_IMAGE'
            }
        }

        stage('Deploy Container') {
            steps {
                sh 'docker stop my-app || true && docker rm my-app || true'
                sh 'docker run -d --name my-app -p 80:80 $DOCKER_REGISTRY/$DOCKER_IMAGE'
            }
        }
    }
}