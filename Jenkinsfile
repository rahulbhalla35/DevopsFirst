pipeline{
    agent any
    stages{
        stage("code checkout"){
            steps{
                checkout scm
            }
        }
        stage("code build"){
            steps{
                sh "mvn install"
            }
        }
        stage("run test"){
            steps{
                sh "mvn test"
            }
        }   
        stage("Sonar Analysis"){
            steps{
                withSonarQubeEnv("Test_Sonar")
                {
                    sh "mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.2:sonar"
                }
            }
        }
        
        stage("Upload to Artifactory"){
            steps{
                rtPublishBuildInfo(
                    serverId: '123456789@artifactory',
                        )
            }
        }
        
        stage('Build Image'){
            steps{
                sh "docker build -t myfirstimage:$(BUILD_NUMBER) ."
            }
        }
        
        stage('Docker Deployment'){
            steps{
                sh "docker run --name myfirstcontainer -d -p 9050:9000 myfisrtimage:$(BUILD_NUMBER)"
            }
        }
    }
}
