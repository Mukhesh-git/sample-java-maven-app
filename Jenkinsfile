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
    stage('building docker image from docker file by tagging') {
      steps {
        sh 'docker build -t mukhesh/pipeline:$BUILD_NUMBER .'
      }   
    }
   
   stage('logging into docker hub') {
      steps {
        sh 'docker login --username="mukhesh" --password="Mukesh$job"'
      }   
    }
     stage('pushing docker image to the docker hub with build number') {
      steps {
        sh 'docker push mukhesh/pipeline:$BUILD_NUMBER'
      }   
    }
    
  }
  
}
