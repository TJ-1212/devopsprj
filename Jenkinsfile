pipeline {
    agent any

    environment {
        GIT_REPO = 'https://github.com/TJ-1212/devopsprj.git'
        LOCAL_DIR = 'E:\\devopsprj'
        IMAGE_NAME = 'javaimg:latest'
        CONTAINER_NAME = 'java_container'
        WSL_ANSIBLE_SCRIPT = '/mnt/e/devopsprj/devopsdeploy.yml'
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Navigate to project directory
                    bat "cd /d %LOCAL_DIR% && docker build -t %IMAGE_NAME% ."
                }
            }
        }

        stage('Deploy with Ansible on WSL') {
            steps {
                script {
                    // Execute Ansible playbook inside WSL
                    bat "wsl ansible-playbook %WSL_ANSIBLE_SCRIPT%"
                }
            }
        }
    }
}