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
            sudo apt-get update -any
            sudo apt-get install rsync -anyrsync --version
            git clone https://github.com/tfutils/tfenv.git ~/tfenv
            ~/tfenv/bin/tfenv install ${TERRAFORM_VERSION}
            ~/tfenv/bin/tfenv use ${TERRAFORM_VERSION}
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
            chmod a+x gradlew
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