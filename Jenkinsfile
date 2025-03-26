pipeline {
    agent any

    environment {
        GIT_REPO = 'https://github.com/TJ-1212/devopsprj.git' // Use SSH URL
        DOCKER_IMAGE = 'javaimg'
        CONTAINER_NAME = 'java_container'
        WSL_ANSIBLE_SCRIPT = '/mnt/e/devopsprj/deploy.yml'
    }

    stages {
        stage('Clone Repository') {
            steps {
                script {
                    bat 'git clone ${GIT_REPO} E:\\devopsprj'
                }
            }
        }

        stage('Build Java Application') {
            steps {
                script {
                    bat 'javac E:\\devopsprj\\HelloWorld.java'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    bat 'docker build -t javaimg E:\\devopsprj'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    bat 'docker run --name ${CONTAINER_NAME} -d javaimg'
                }
            }
        }

        stage('Deploy Using Ansible in WSL') {
            steps {
                script {
                    bat 'wsl ansible-playbook ${WSL_ANSIBLE_SCRIPT}'
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline Execution Completed'
        }
    }
}
