pipeline {
    agent any
   tools {
        git 'Git'  // Name should be 'Git' as per your configuration
    }
    environment {
        // The recipient email address
        RECIPIENT_EMAIL = 'pj19632@gmail.com'
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
        stage('Example Stage') {
            steps {
                script {
                    // Example command (you can replace this with your actual steps)
                    echo "Pankaj Jain is hot suvrata"
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

