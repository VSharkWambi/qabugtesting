pipeline {
  agent {
    docker { image 'ruby:2.5' }
  }
  environment {
     APP_PORT = 3000
     GRID_IP = '192.168.140.20:4444'
     NODES = 2
  }
  stages {
    stage('Application') {
      steps {
        sh 'sudo apt-get update && apt-get install nodejs'
        sh 'bundle install'
        sh 'rake db:create'
        sh 'rake db:migrate'
        sh 'rake db:seed'
        sh "rails s -p ${env.APP_PORT}"
      }
    }
    stage('Checkout Test Suite') {
      steps {
        dir('test-suite') {
          git branch: 'snapshot-18', url: 'https://github.com/skinnyjames/cucumber-training.git' 
          sh 'bundle install'
          sh "bundle exec parallel_cucumber features/ -m ${env.NODES} -o IP=${env.GRID_IP} APP_PORT=${env.APP_PORT}"
        }
      }
    }
  }
}
