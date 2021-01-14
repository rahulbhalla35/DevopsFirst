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
        stage("Sonar Analysis"){
            steps{
                withSonarQubeEnv("Test_Sonar")
                {
                    sh "mvn org.sonarsource.sacnner.maven:sonar-maven-plugin:3:2:sonar"
                }
            }
        }
    }
}
