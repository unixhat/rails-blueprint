pipeline {
  agent any
  stages {
    stage('Deploy Staging') {
      when {
        expression {
          BRANCH_NAME ==~ /(migrate|staging|develop|hotfix.*|release.*)/
        }
      }
      steps {
        sh 'cp /Users/heriyanto/env/migrate.sleekr.env ${WORKSPACE}/.env'
        sh 'cp /Users/heriyanto/env/migrate.sleekr.database.yml ${WORKSPACE}/config/database.yml'
        sh 'docker build -t heriyanto/rails-blueprint:${BUILD_NUMBER} .'
        sh 'docker push heriyanto/rails-blueprint:${BUILD_NUMBER}'
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
        sh 'cp /Users/heriyanto/env/sleekr.env ${WORKSPACE}/.env'
        sh 'cp /Users/heriyanto/env/sleekr.database.yml ${WORKSPACE}/config/database.yml'
        sh 'docker build -t heriyanto/rails-blueprint:${BUILD_NUMBER} .'
//        sh 'docker push heriyanto/rails-blueprint:${BUILD_NUMBER}'
//        sh 'kubectl set image deployment/prd-helpster-pne prd-helpster-pne=510466226947.dkr.ecr.ap-southeast-1.amazonaws.com/helpster-pne:${BUILD_NUMBER}'
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
