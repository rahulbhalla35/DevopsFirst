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
                
                rtMavenDeployer (
                    id: 'deployer',
                    serverId: '123456789@artifactory',
                    releaseRepo: 'firstartifactqa',
                    snapshotRepo: 'firstartifactqa'
                )
                rtMavenRun(
                    pom: 'pom.xml',
                    goals: 'clean install',
                    deployerId: 'deployer',
                        )
                rtPublishBuildInfo(
                    serverId: '123456789@artifactory',
                        )
            }
        }
    }
}
