FROM tomcat:8.0-alpine
MAINTAINER Rahul
RUN apk update
RUN apk add wget
RUN wget --user admin --password Pass@123 -O /usr/local/tomcat/webapps/sampleapplication.war http://localhost:8081/artifactory/firstartifactqa/com/nagarro/devops-tools/devops/demosampleapplication/1.0.0-SNAPSHOT/demosampleapplication-1.0.0-SNAPSHOT.war
EXPOSE 9000
CMD /usr/local/tomcat/bin/catalina.sh run
