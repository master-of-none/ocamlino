pipeline {
  agent {
    docker {
      image 'alpine:3.14'
      args '-u root' // match opam user UID if needed
    }
  }

  environment {
    OPAMYES = 'true'
  }

  stages {
    stage('Install tools') {
      steps {
        sh '''
         apk add --no-cache bash curl git gmp gmp-dev build-base \
            ocaml ocaml-compiler-libs opam

          # Create non-root user if not exists
          if ! id opam >/dev/null 2>&1; then
            adduser -D -u 1000 opam
          fi

          su opam -c '
            opam init -y --disable-sandboxing && \
            bash -c "eval \\"\\$(opam env)\\" && opam install -y dune"
          '
        '''
      }
    }

    stage('Build & Test') {
      steps {
        sh '''
          su opam -c '
            bash -c "eval \\"\\$(opam env)\\" && dune build @all && dune runtest"
          '
        '''
      }
    }
  }

  post {
    success {
      echo '✅ Build and test successful!'
    }
    failure {
      echo '❌ Something failed during build or test.'
    }
  }
}
