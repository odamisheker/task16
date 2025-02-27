pipeline {
    agent any

    environment {
        SSH_KEY = "/home/keyokeyok/RSAPair-task2.pem"
        EC2_USER = "ubuntu"
        EC2_HOST = "54.226.232.93"
        NGINX_IMAGE = "odamisheker/images:nginx_task16"
        APACHE_IMAGE = "odamisheker/images:apache_task16"
    }

    stages {
        stage('Pull Docker Image on EC2') {
            steps {
                script {
                    sh '''
                    ssh -o StrictHostKeyChecking=no -i ${SSH_KEY} ${EC2_USER}@${EC2_HOST} << 'EOF'

                        sudo docker pull ${NGINX_IMAGE}
                        sudo docker run -d -p 443:443 --name nginx ${NGINX_IMAGE}
                        sudo docker pull ${APACHE_IMAGE}
                        sudo docker run -d -p 8080:8080 --name apache ${APACHE_IMAGE}
                        EOF
                    '''
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
