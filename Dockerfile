# tomcat
#
# This image provides a base for building and running tomcat applications.
#FROM registry.access.redhat.com/jboss-webserver-3/tomcat7-openshift
FROM tomcat

# Default destination of scripts and sources, this is where assemble will look for them
LABEL io.openshift.s2i.scripts-url=image:///usr/local/sti

#RUN yum install -y mvn && \
#    yum clean all -y

RUN mkdir /usr/local/sti 

LABEL version="1.0"
LABEL description="Base Tomcat7 Openshift3 builder images that takes WAR or Folders and deploys them.  \
This is to mimic what App Former does by taking WAR files are deploying them to gears. \
use this as the example builder image to build other builder images "


# BASE STI files for this image creation
# Copy the builder STI scripts from the specific language image to /usr/local/sti
ADD ./sti/ /usr/local/sti

# BASE config files for this image creation
# In assemble file, we can provide user of this image to override these files
# Add sti tomcat customizations for the builder image
ADD ./conf/* /usr/local/tomcat/conf/

# Create jboss group and user, set file ownership to that user.
#RUN groupadd -r jboss -g 433 && \
#    useradd -u 431 -r -g jboss -d /home/jboss -s /sbin/nologin -c "jboss user" jboss && \
#    chown -R jboss:jboss /home/jboss && \
#    chmod -R go+rw /opt/webserver && \
#    chown -eR jboss:jboss /opt/webserver && \
#    mkdir /home/jboss/source && \
#    chown -R jboss:jboss /usr/local/sti

RUN chmod 777 /usr/local/sti/* && \
    export PATH=$PATH:/usr/local/sti/

ENV HOME=/usr/tomcat JWS_HOME=/usr/local/tomcat

WORKDIR /usr/tomcat
#USER jboss

EXPOSE 8080

CMD ["usage"]
