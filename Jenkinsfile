pipeline {
    agent any
    tools {
        git 'Git'  // Name should be 'Git' as per your configuration
    }
    environment {
        // The recipient email address
        RECIPIENT_EMAIL = 'pj19632@gmail.com'
        IMAGE_NAME = 'my-node-app'  // Define your image name
        DOCKER_REGISTRY = 'docker.io' // If using a registry
        DOCKER_TAG = 'latest' // Define the tag you want to use
    }

    stages {
        stage('Git Info') {
            steps {
                script {
                    sh 'git --version' // Check if Jenkins is using the correct Git version
                    sh 'which git' // This prints the location of the git executable used by Jenkins
                }
            }
        }
        
        stage('Checkout') {
            steps {
                // Check out the repository and specify the branch
                git branch: 'main', url: 'https://github.com/pankaj8979/pipeline-demo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image using the Dockerfile in the workspace
                    sh "docker build -t ${env.IMAGE_NAME}:${env.DOCKER_TAG} ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Run the Docker container, mapping port 8080 from the container to the host
                    sh "docker run -d -p 8081:8080 ${env.IMAGE_NAME}:${env.DOCKER_TAG}"
                }
            }
        }

        stage('Example Stage') {
            steps {
                script {
                    // Example command (you can replace this with your actual steps)
                    echo "Pankaj Jain is hot suvrata baby come fast naa!"
                    echo 'Running some tasks...'
                    // Simulating a task on Windows
                    sh 'echo Doing work > output.txt'
                }
            }
        }
    }

    post {
        success {
            script {
                // Send HTML email on success
                emailext(
                    subject: "Jenkins Pipeline Success: ${env.JOB_NAME}",
                    body: """
                        <h2>Pipeline Success Hurray!</h2>
                        <p>The pipeline <b>${env.JOB_NAME}</b> has completed successfully.</p>
                        <p><i>Job details:</i></p>
                        <ul>
                            <li><b>Build Number:</b> ${env.BUILD_NUMBER}</li>
                            <li><b>Status:</b> Success</li>
                            <li><b>Time:</b> ${currentBuild.durationString}</li>
                        </ul>
                    """,
                    to: "${env.RECIPIENT_EMAIL}",
                    mimeType: 'text/html'
                )
            }
        }

        failure {
            script {
                // Send HTML email on failure
                emailext(
                    subject: "Jenkins Pipeline Failed: ${env.JOB_NAME}",
                    body: """
                        <h2>Pipeline Failed</h2>
                        <p>The pipeline <b>${env.JOB_NAME}</b> has failed.</p>
                        <p><i>Job details:</i></p>
                        <ul>
                            <li><b>Build Number:</b> ${env.BUILD_NUMBER}</li>
                            <li><b>Status:</b> Failure</li>
                            <li><b>Time:</b> ${currentBuild.durationString}</li>
                        </ul>
                        <p><b>Check the Jenkins console output for more details.</b></p>
                    """,
                    to: "${env.RECIPIENT_EMAIL}",
                    mimeType: 'text/html'
                )
            }
        }
    }
}

