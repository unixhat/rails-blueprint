pipeline {
  agent any
  stages {
    stage('Migrating') {
      when {
        expression {
          BRANCH_NAME ==~ /(migrate|staging|develop|hotfix.*|release.*)/
        }
      }
      steps {
        sh 'cp /opt/env/migrate.sleekr.env ${WORKSPACE}/.env'
        sh 'cp /opt/env/migrate.sleekr.database.yml ${WORKSPACE}/config/database.yml'
        sh 'docker build -t heriyanto/rails-blueprint:base .'
        sh 'docker push heriyanto/rails-blueprint:base'
      }
    }
    stage('Unit test') {
      steps {
        echo 'Unit test here'
      }
    }
    stage('Deploy Production') {
      when {
        branch 'master'
      }
      steps {
        timeout(time: 1, unit: 'HOURS') {
          input 'Deploy to Production?'
        }
        sh 'cp /opt/env/sleekr.env ${WORKSPACE}/.env'
        sh 'cp /opt/env/sleekr.database.yml ${WORKSPACE}/config/database.yml'
        sh 'docker build -t heriyanto/rails-blueprint:${BUILD_NUMBER} .'
        sh 'docker push heriyanto/rails-blueprint:${BUILD_NUMBER}'
        sh 'kubectl set image deployment/sleekr-blueprint sleekr-blueprint=heriyanto/rails-blueprint:${BUILD_NUMBER}'
      }
    }
    stage('Clean') {
      steps {
        echo 'clean'
        sh ''
      }
    }
  }
}
