pipeline {
  agent any 
  stages {
      stage('Build Docker Image') {
        steps {
          sh 'docker-compose -f "udacity-c3-deployment/docker/docker-compose-build.yaml" build --parallel'
          exit 0 
          }
        }
      stage('Upload Docker Image') {
          steps {
            sh 'docker-compose -f udacity-c3-deployment/docker/docker-compose-build.yaml push'
            exit 0 
              }
        }
      stage('Start microservices') {
          steps {
            sh 'cd udacity-c3-deployment/docker && docker-compose up'
             }
        }
      }
    }
