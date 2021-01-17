FROM tomcat:8.0-alpine
EXPOSE 8080
RUN apk update
RUN apk add wget --no-cache
RUN wget --user=admin --password=Pass@123 -O /usr/local/tomcat/webapps/sampleapplication.war http://192.168.1.14:8081/artifactory/firstartifactqa/com/nagarro/devops-tools/devops/demosampleapplication/1.0.0-SNAPSHOT/demosampleapplication-1.0.0-SNAPSHOT.war
CMD /usr/local/tomcat/bin/catalina.sh run
