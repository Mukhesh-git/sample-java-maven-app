# Pull base image 
From tomcat 

# Maintainer 
MAINTAINER "mukesh" 
COPY webapp/target/webapp.war /usr/local/tomcat/webapps
