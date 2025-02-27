pipeline {
    agent any

    environment {
        EC2_USER = "ubuntu"
        EC2_HOST = "54.226.232.93"
        SSH_KEY = "/home/keyokeyok/RSAPair-task2.pem"
    }

    stages {
        stage('Pull Docker Image on EC2') {
            steps {
                script {
                    sh '''
                    ssh -i $SSH_KEY $EC2_USER@$EC2_HOST 'sudo docker pull odamisheker/images:nginx_task16; bash -l'"
                    '''
                }
            }
        }
    }
}
