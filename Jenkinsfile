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
                    sh "ssh -o StrictHostKeyChecking=no -i ${SSH_KEY} ${EC2_USER}@${EC2_HOST} '${remoteCommand}'"
                    sh "sudo docker run -d -p 443:443 --name nginx ${DOCKER_IMAGE}"
                }
            }
        }
        // stage('Run Nginx container on EC2') {
        //     steps {
        //         script {
        //             sh "sudo docker run -d -p 443:443 --name nginx odamisheker/images:nginx_task16"
        //         }
        //     }
        // }
    }
}
