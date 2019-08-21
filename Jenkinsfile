pipeline {
  agent any 
  stages {
      stage('Build Docker Image') {
        steps {
          
          sh '''#!/bin/bash
              cd  udacity-c3-deployment/docker/
              pwd 
              docker-compose --f docker-compose-build.yaml build --parallel
             '''
          }
        }
      
      }
    }
  
