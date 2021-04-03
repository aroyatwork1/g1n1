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
      steps {        
          withCredentials([string(credentialsId: 'slave-1-pass', variable: 'slave_pass')]) {
            sh "make publish"               
          }          
      }           
    }

    stage('Deploy') {
      steps {        
          withCredentials([string(credentialsId: 'slave-1-pass', variable: 'slave_pass')]) {
            sh "make deploy"               
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
