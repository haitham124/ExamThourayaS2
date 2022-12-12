pipeline {
    
    agent any
    
    
    environment {
        
        registry = "haitham124/Othmani@123"
        //registryCredential = 'dockerHub'
        //dockerImage = ''
        NEXUS_VERSION = "nexus3"
        // This can be http or https
        NEXUS_PROTOCOL = "http"
        // Where your Nexus is running. 'nexus-3' is defined in the docker-compose file
        NEXUS_URL = "192.168.122.1:8081"
        // Repository where we will upload the artifact
        NEXUS_REPOSITORY = "nexus_devop"
        // Jenkins credential id to authenticate to Nexus OSS
        NEXUS_CREDENTIAL_ID = "NEXUS_CRED"
    }

    stages {
        stage('checkout GIT') {
            steps{
                echo 'Pulling ... ';
            git branch:'haitham' ,
            url : 'https://github.com/haitham124/ExamThourayaS2.git';
            }
        }
        stage("Mvn clean") {
      
      steps {
        echo 'cleaning the application ...'
        sh "mvn clean"
      }
    }
    stage("Mvn compile") {
      
      steps {
        echo 'compiling the application ...'
        sh "mvn compiler:compile"
      }
    }
    stage('Unit Test') {
            steps{
                sh 'mvn test'
            }
    }
    stage("test statique sonar") {
      
        steps {
        sh "mvn sonar:sonar \
  -Dsonar.projectKey=snar \
  -Dsonar.host.url=http://192.168.122.1:9000 \
  -Dsonar.login=1b03763127842573dafc742bf2217bb1f294ce51"
      }
    }
    stage("DEPLOY with Nexus") {
            steps { 
                sh'mvn clean deploy -Dmaven.test.skip=true -Dresume=false'
            }
        }
        stage("Building Docker Image") {
                steps{
                    sh 'docker build -t haitham124/ratrapage .'
                }
        }
        stage("Login to DockerHub") {
                steps{
                
                    sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u haitham124 -p Othmani@123'
                }
        }
        stage("Push to DockerHub") {
                steps{
                    sh 'docker push haitham124/ratrapage'
                }
        }
        
    
        
        
        
   
        
    }
    
}
