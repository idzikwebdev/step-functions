// CODE_CHANGES = getGitChanges()
pipeline {
    agent any
    parameters {
//         string(name: 'VERSION', defaultValue:'', description: 'version to deploy')
        choice(name: 'VERSION', choices: ['1.0', '1.1'], description: 'choose')
        booleanParam(name:'executeTests', defaultValue: true, description:'')
    }
//     tools {
        // tools available gradle, maven and jdk, you dont need to write it
//         mvn 'Maven'
//     }
    environment {
        NEW_VERSION = '1.3.0'
        SERVER_CREDENTIALS = credentials('')
    }
    stages {
        stage("build") {
            when {
                expression {
                    BRANCH_NAME == 'master'
//                     || CODE_CHANGES == true
                }
            }
            steps {
                echo "Building app ${VERSION}"
            }
        }
        stage("test") {
            when {
                expression {
                    BRANCH_NAME == 'master' || BRANCH_NAME == 'dev'
                }
            }
            steps {
            echo 'Testing app'
                  }
            }
        stage("deploy") {
            when {
                expression {
                    params.executeTests
                }
            }
             steps {
             echo 'Deploying app'
//              withCredentials([usernamePassword(credentials: 'github',usernameVariable:USER, passwordVariable:PASSWORD)]){
//                  sh "Credentials"
//                  echo "${USER} and ${PASSWORD}"
//                  echo "Version ${params.VERSION}"
//                  }
//              echo "${SERVER_CREDENTIALS}"
             }
        }
    }
//     post {
//         always {
//         echo 'Always'
//         }
//         success {
//         echo 'Success'
//         }
//         failure {
//         echo 'Failure'
//         }
//     }
}