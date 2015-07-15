# tomcat
#
# This image provides a base for building and running tomcat applications.
# Recommendation: Create a company wide base image from an OS and install basic tools. 
# Maintain a git project like this and have it build using a CI tool and push it to appropriate docker registory.
# Use that image as the base for rest of the STI builder images, such as, tomcat, Nodejs etc.
# IMPORTANT: Follow Docker image creation best practices https://docs.docker.com/articles/dockerfile_best-practices/
# Each line in this file will become a docker layer and it will have a huge impact on efficiency.
FROM tomcat

RUN mkdir /usr/local/sti 

# Default destination of scripts and sources, this is where assemble will look for them
LABEL io.openshift.s2i.scripts-url=image:///usr/local/sti
LABEL version="1.0"
LABEL description="Base Tomcat7 Openshift3 builder images that takes WAR or Folders and deploys them.  \
This is to mimic what App Former does by taking WAR files are deploying them to gears. \
use this as the example builder image to build other builder images "

# BASE STI files for this image creation
# Copy the builder STI scripts from the specific language image to /usr/local/sti
ADD ./sti/ /usr/local/sti

# May be a bug STI needs these scripts to be executable
RUN chmod +x /usr/local/sti/* 

# BASE config files for this image creation
# In assemble file, we can provide user of this image to override these files
# Add sti tomcat customizations for the builder image
ADD ./conf/* /usr/local/tomcat/conf/

ENV JWS_HOME /usr/local/tomcat

EXPOSE 8080

CMD ["/usr/local/sti/usage"]
