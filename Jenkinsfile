pipeline {
    agent any 
    stages {
        stage('Build') {
            steps {
                script {
                    // Сборка Docker-образа
                    sh 'docker build -t my_app_image .'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Остановка и удаление текущего контейнера
                    sh 'docker stop my_app_container || true'
                    sh 'docker rm my_app_container || true'
                    // Запуск нового контейнера
                    sh 'docker run -d --name my_app_container -p 80:80 my_app_image'
                }
            }
        }
    }
}
