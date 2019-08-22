pipeline {
  agent any 
  stages {
      stage('Build Docker Image') {
        steps {
          sh 'docker-compose udacity-c3-deployment/docker/docker-compose-build.yaml build --parallel'
          }
        }
      stage('Upload Docker Image') {
          steps {
            sh 'docker-compose -f udacity-c3-deployment/docker/docker-compose-build.yaml push'
              }
        }
      stage('Start microservices') {
          steps {
            sh 'cd udacity-c3-deployment/docker && docker-compose up'
             }
        }
      }
    }
