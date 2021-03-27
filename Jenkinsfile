pipeline {
  
  agent ANY

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
        sh "make publish"
      }
    }

    stage('Done') {
      steps {
        echo "Build done...."
      }
    }

  }
  
  post {
    always {
      script {
        notifyStash(currentBuild.result)
      }
    }
  }

}
