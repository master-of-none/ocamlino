pipeline {
  agent {
    docker {
      image 'ocaml/opam:debian-11'
      args '-u opam'  // run as opam user
    }
  }

  environment {
    OPAMYES = 'true'
  }

  stages {
    stage('Setup') {
      steps {
        sh '''
          opam update
          opam install dune
        '''
      }
    }

    stage('Build') {
      steps {
        sh 'dune build @all'
      }
    }

    stage('Test') {
      steps {
        sh 'dune runtest'
      }
    }
  }

  post {
    failure {
      echo 'Build or test failed!'
    }
    success {
      echo 'All good!'
    }
  }
}
