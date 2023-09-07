# Use the official Tomcat base image
FROM tomcat:9.0-jdk11-openjdk

# Set the working directory to the Tomcat webapps directory
WORKDIR /usr/local/tomcat/webapps

# Remove the default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the app folder into the container's webapps directory
COPY app/ /usr/local/tomcat/webapps/app/

# Copy the configuration files to the WEB-INF directory
COPY config/tap.properties /usr/local/tomcat/webapps/app/WEB-INF/
COPY config/tables.xml /usr/local/tomcat/webapps/app/WEB-INF/

RUN chown -R 1000:1000 /usr/local/tomcat/webapps/app/

# Start Tomcat
CMD ["catalina.sh", "run"]

