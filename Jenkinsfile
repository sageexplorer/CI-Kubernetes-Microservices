pipeline {
  agent any 
  stages {
      stage('Build Docker Image') {
        steps {
          
          sh '''#!/bin/bash
              docker-compose -f udacity-c3-deployment/docker/docker-compose-build.yaml build --parallel
             '''
          }
        }
      stage('Upload Docker Image') {
          steps {
            sh 'docker-compose -f udacity-c3-deployment/docker/docker-compose-build.yaml push'
              }
        }

      }
    }
  
