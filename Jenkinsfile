pipeline {
    agent any

    environment { 
        // CI="false"
        DLD="/var/www/html/dl.gawati.org/dev"
        PKF="windows-tools"
    } 

//  define {
//      def COLOR_MAP = ['SUCCESS': 'good', 'FAILURE': 'danger', 'UNSTABLE': 'danger', 'ABORTED': 'danger']
//      def STATUS_MAP = ['SUCCESS': 'success', 'FAILURE': 'failed', 'UNSTABLE': 'failed', 'ABORTED': 'failed']
//  }

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
                    def packageFile = readJSON file: 'package.json'
                    sh "zip -r - . -x@pkgexclude.txt > $DLD/$PKF-${packageFile.version}.zip"
                    sh "[ -L $DLD/$PKF-latest.zip ] && rm -f $DLD/$PKF-latest.zip ; exit 0"
                    sh "[ -e $DLD/$PKF-latest.zip ] || ln -s $PKF-${packageFile.version}.zip $DLD/$PKF-latest.zip"
                }
            }
        }
        stage('Clean') {
            steps {
                cleanWs(cleanWhenAborted: true, cleanWhenNotBuilt: true, cleanWhenSuccess: true, cleanWhenUnstable: true, cleanupMatrixParent: true, deleteDirs: true)
            }
        }        
    }

    post {
        always {
//          slackSend (color: COLOR_MAP[currentBuild.currentResult], message: "${currentBuild.currentResult}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
            slackSend (message: "${currentBuild.currentResult}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
        }
    }
}

