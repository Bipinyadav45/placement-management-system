FROM tomcat:9.0
COPY dist/pms.war /usr/local/tomcat/webapps/
EXPOSE 8080