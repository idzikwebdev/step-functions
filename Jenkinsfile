pipeline {
    agent any
    parameters {
        choice(name: 'TERRAFORM_VERSION', choices: ['0.13.7', '0.14.7'], description: 'choose terraform version')
        booleanParam(name: 'executeTests', defaultValue: true, description: '')
    }
    stages {
        stage("init") {
            steps {
            echo 'Init'
            }
       }
        stage("build") {
            steps {
            echo 'Build'
            sh '''
            terraform init
            '''
            }
        }
        stage("test") {
            when {
                expression {
                    params.executeTests
                }
            }
            steps {
            echo 'Test'
            sh '''
            ./gradlew clean build
            '''
            }
        }
        stage("deploy") {
            steps {
            echo 'Deploy'
            }
        }
    }
 }