pipeline{
    agent{
        node {
            label "ubuntu_vm"
        }
    }
    
    stages{
        stage("Build Docker Image"){
            steps{
                echo "========executing Build Docker Image========"
                sh 'docker build -t ganeshkale/sample_angular:latest .'
            }
            post{
                always{
                    echo "========always========"
                }
                success{
                    echo "========Build Docker Image executed successfully========"
                }
                failure{
                    echo "========Build Docker Image execution failed========"
                }
            }
        }
        stage("Push Docker Image"){
            steps{
                withCredentials([usernamePassword(credentialsId: 'gkdockerhub', passwordVariable: 'gkdockerhubPassword', usernameVariable: 'gkdockerhubUser')]) {
                sh "docker login -u ${env.gkdockerhubUser} -p ${env.gkdockerhubPassword}"
                sh 'docker push ganeshkale/sample_angular:latest'
        }

            }
        }
        stage("Test Docker Image"){
            agent {         
                docker {  
                    image 'ganeshkale/sample_angular:latest'
                    args '-p 8000:80'         
                }       
            }       
            steps{
                //sh "curl localhost:8000"
                sh 'npm --version'
            }
        }
    }
    post{
        always{
            echo "========always========"
        }
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}