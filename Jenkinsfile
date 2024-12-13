pipeline {
    agent {
        docker {
            image 'alpine:latest' // Замените на необходимый образ
            args '-u root:root'   // Добавьте, если нужно запустить контейнер с правами root
        }
    }
    stages {
        stage('Test') {
            steps {
                sh 'echo "Hello from Docker in Jenkins!"'
            }
        }
    }
}
