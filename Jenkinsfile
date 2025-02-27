pipeline {
    agent any

    environment {
        SSH_KEY = "/home/keyokeyok/RSAPair-task2.pem"
        EC2_USER = "ubuntu"
        EC2_HOST = "54.164.50.125"
        NGINX_IMAGE = "odamisheker/images:nginx_task16"
        APACHE_IMAGE = "odamisheker/images:apache_task16"

    stages {
        stage('Build Docker Images') {
            steps {
                script {
                    sh '''
                    cd /home/keyokeyok/internship/task12 &&
                        sudo docker build -t ${NGINX_IMAGE} .
                    
                    cd /home/keyokeyok/internship/task12/apache &&
                        sudo docker build -t ${APACHE_IMAGE} .
                    '''
                }
            }
        }
        stage('Push Docker Images to DockerHub') {
            steps {
                script {
                    sh '''
                    sudo docker push ${NGINX_IMAGE}
                    sudo docker push ${APACHE_IMAGE}
                    '''
                }
            }
        }
        stage('Delete previous containers and images') {
            steps {
                script {
                    sh '''
                    ssh -o StrictHostKeyChecking=no -i ${SSH_KEY} ${EC2_USER}@${EC2_HOST} '
                        sudo docker ps -a -q | xargs -r sudo docker rm -f
                        sudo docker images -aq | xargs -r sudo docker rmi -f
                    '
                    '''
                }
            }
        }
        stage('Pull and Run Docker Containers on EC2') {
            steps {
                script {
                    sh '''
                    ssh -o StrictHostKeyChecking=no -i ${SSH_KEY} ${EC2_USER}@${EC2_HOST} "
                        sudo docker pull ${NGINX_IMAGE} &&
                        sudo docker run -d -p 443:443 --name nginx ${NGINX_IMAGE} &&
                        sudo docker pull ${APACHE_IMAGE} &&
                        sudo docker run -d -p 8080:8080 --name apache ${APACHE_IMAGE}
                    "
                    '''
                }
            }
        }
    }
}
