pipeline {
    agent any
    parameters {
        choice(name: 'VERSION', choices: ['1.1.0', '1.2.0', '1.3.0'], description: '')
        booleanParam(name: 'executeTests', defaultValue: true, description: '')
    }
    stages {
        stage("init") {
            steps {
            }
        }
        stage("build") {
            steps {
            }
        }
        stage("test") {
            when {
                expression {
                    params.executeTests
                }
            }
            steps {
            }
        }
        stage("deploy") {
            steps {
            }
        }
    }   
}