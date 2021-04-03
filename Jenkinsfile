#!/usr/bin/env groovy

pipeline {
  
  agent { label "generic_node_1" }

  stages {

    stage('Start') {
      steps {
        echo "Starting build...."
      }
    }    

    stage('Clean') {
      steps {
        sh "make clean"
      }
    }

    stage('Build') {
      steps {        
        sh "make build"
      }
    }

    stage('Test') {
      steps {        
        sh "make test"
      }
    }

    stage('Publish') {
      withCredentials([string(credentialsId: 'slave-1-pass', variable: 'slave_pass')]) {
        steps {        
          sh "make publish"
        }        
      }      
    }

    stage('Done') {
      steps {
        echo "Build done...."
      }
    }

  }

}
