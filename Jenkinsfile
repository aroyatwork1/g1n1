pipeline {
  
  stages {
    stage('Start') {
      steps {
        sh "make clean"
        sh "make build"
        sh "make test"
        sh "make publish"
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
