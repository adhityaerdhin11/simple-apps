pipeline {
    agent { label 'dev' }

    stages {
        stage('Pull SCM') {
            steps {
                git branch: 'main', url: 'https://github.com/adhityaerdhin11/simple-apps-new.git'
            }
        }
        
        stage('Build') {
            steps {
                sh'''
                cd app
                npm install
                '''
            }
        }
        
        stage('Testing') {
            steps {
                sh'''
                cd app
                npm test
                npm run test:coverage
                '''
            }
        }
        
        stage('Code Review') {
            steps {
                sh'''
                cd app
sonar-scanner \
  -Dsonar.projectKey=simple-apps \
  -Dsonar.sources=. \
  -Dsonar.host.url=http://172.23.3.114:9000 \
  -Dsonar.login=sqp_2fa31a7e9dbc789c49a701405748b2eb01be745d
                '''
            }
        }
        
        stage('Deploy') {
            steps {
                sh'''
                docker compose up --build -d
                '''
            }
        }
        
        stage('Backup') {
            steps {
                 sh 'docker compose push' 
            }
        }
    }
}