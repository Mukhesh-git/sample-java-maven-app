pipeline {
  agent any
  tools {
    maven 'maven'
  }
  stages {
   stage ('Initialize') {
            steps {
                sh '''
                    M2_HOME=/opt/maven
                    M2=/opt/maven/bin
                    PATH=$PATH:$HOME/bin/:$JAVA_HOME:$M2:$M2_HOME
                    export PATH
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                    whoami
                '''
            }
        }
    stage('cleaning package') {
      steps {
        sh 'mvn clean install package'
      }
    }   
    
    environment {
       DOCKERHUB_CREDENTIALS = credentials("mukhesh-dockerhub")
  }
    
    stage('building docker image from docker file by tagging') {
      steps {
        sh 'docker build -t mukhesh/pipeline:$BUILD_NUMBER .'
      }   
    }
   
stage('logging into docker hub') {
      steps {
        sh 'echo $DOCKERHUB_CREDNETIALS_PSW | docker login -u $DOCKERHB_CREDENTIALS_USR --password-stdin'
      }   
    }
   
    
  }
  
}
