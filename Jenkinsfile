pipeline {
    agent any

    stages {
        stage('Prerun Diag') {
            steps {
                sh 'pwd'
            }
        }
        stage('Setup') {
            steps {
                sh 'ls -la'
            }
        }
        stage('Build') {
            steps {
                sh 'echo build'
            }
        }
        stage('Upload') {
            steps {
                script {
                    sh """
wget -qO- http://dl.gawati.org/dev/jenkinslib-latest.tbz | tar -xvjf -
. ./jenkinslib.sh
cd installer
PkgPack
PkgLinkRoot
"""
                }
            }
        }
        stage('Clean') {
            steps {
                cleanWs(cleanWhenAborted: true, cleanWhenNotBuilt: true, cleanWhenSuccess: true, cleanWhenUnstable: true, cleanupMatrixParent: true, deleteDirs: true)
            }
        }        
    }

}

