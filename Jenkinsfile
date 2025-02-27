pipeline {
    agent any

    environment {
        SSH_KEY = "/home/keyokeyok/RSAPair-task2.pem"
        EC2_USER = "ubuntu"
        EC2_HOST = "54.226.232.93"
        DOCKER_IMAGE = "odamisheker/images:nginx_task16"
    }

    stages {
        stage('Pull Docker Image on EC2') {
            steps {
                script {
                    def remoteCommand = "sudo docker pull ${DOCKER_IMAGE}"
                    sh "ssh -i ${SSH_KEY} ${EC2_USER}@${EC2_HOST} '${remoteCommand}'"
                }
            }
        }
    }
}
