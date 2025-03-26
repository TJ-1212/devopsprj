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
        stage('Clone Repository') {
            steps {
                script {
                    // Ensure directory exists
                    if (fileExists(LOCAL_DIR)) {
                        bat "rmdir /s /q ${LOCAL_DIR}"
                    }
                    // Clone the repo
                    bat "git clone %GIT_REPO% %LOCAL_DIR%"
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Navigate to project directory
                    bat "cd /d %LOCAL_DIR% && docker build -t %IMAGE_NAME% ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Stop and remove the container if it exists
                    bat "docker stop %CONTAINER_NAME% || exit 0"
                    bat "docker rm %CONTAINER_NAME% || exit 0"
                    // Run the new container
                    bat "docker run --rm --name %CONTAINER_NAME% %IMAGE_NAME%"
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