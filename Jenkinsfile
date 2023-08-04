pipeline {
    // define the exact agent you want to use to run these jobs via label
    agent {
        label 'workernode-rac2'
    }

    stages {
        stage('Checkout') {
            steps {
                // Get some code from a GitHub repository
                checkout scm 
            }
        }

        stage('Build image') {
            steps {
                dir("${WORKSPACE}/vote") {
                sh 'docker build -t 853931821519.dkr.ecr.us-east-1.amazonaws.com/rac2-devsecops-registry:v${BUILD_NUMBER} .'
                }
            }
    }

        
        stage('Login to ECR') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws_credentials', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 853931821519.dkr.ecr.us-east-1.amazonaws.com'
                }
            }
        }

        stage('Push image to registry') {
            steps {
                sh "docker push 853931821519.dkr.ecr.us-east-1.amazonaws.com/rac2-devsecops-registry:latest:v${BUILD_NUMBER}" 
                }         
            }
    }
post{
    always {  
      sh 'docker logout'  
      cleanWs()       
    }      
  }

}