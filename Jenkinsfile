#!/usr/bin/env groovy

pipeline {
  
  agent { label "generic_node_2" }

  stages {

    stage('Start') {
      steps {
        sh "make start"
      }
    }    

    stage('Clean') {
      steps {
        sh "make clean"
      }
    }

    stage('Build') {
      steps {
        withCredentials([string(credentialsId: 'docker_hub_pass', variable: 'docker_hub_pass')]) {
            sh "make build"
        }
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
          withCredentials([string(credentialsId: 'slave-1-pass', variable: 'slave_pass'), string(credentialsId: 'docker_hub_pass', variable: 'docker_hub_pass')]) {
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
