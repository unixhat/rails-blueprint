pipeline {
  agent any
  stages {
    stage('Deploy Staging') {
      when {
        expression {
          BRANCH_NAME ==~ /(master|staging|develop|hotfix.*|release.*)/
        }
      }
      steps {
        echo 'Deploying to Kubernetes Infrastructure'
        sh 'cp /var/lib/jenkins/env/stg-pne.env ${WORKSPACE}/.env'
        sh 'eval "$(aws ecr get-login --region ap-southeast-1 --no-include-email)"'
        sh 'docker build -t 510466226947.dkr.ecr.ap-southeast-1.amazonaws.com/helpster-pne:${BUILD_NUMBER} .'
        sh 'docker push 510466226947.dkr.ecr.ap-southeast-1.amazonaws.com/helpster-pne:${BUILD_NUMBER}'
        sh 'kubectl set image deployment/stg-helpster-pne stg-helpster-pne=510466226947.dkr.ecr.ap-southeast-1.amazonaws.com/helpster-pne:${BUILD_NUMBER}'
      }
    }
    stage('Unit UAT') {
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
        sh 'cp sleekr.env ${WORKSPACE}/.env'
        sh 'cp sleekr.database.yml ${WORKSPACE}/config/database.yml'
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
