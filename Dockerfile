# tomcat
#
# This image provides a base for building and running tomcat applications.
FROM registry.access.redhat.com/jboss-webserver-3/tomcat7-openshift


# BASE STI files for this image creation
# Copy the builder STI scripts from the specific language image to /usr/local/sti
COPY ./sti/ /usr/local/sti

# BASE config files for this image creation
# In assemble file, we can provide user of this image to override these files
# Add sti tomcat customizations for the builder image
ADD ./conf/* /opt/webserver/conf


# Default destination of scripts and sources, this is where assemble will look for them
#LABEL io.s2i.destination=/tmp/src

ENV HOME /home/jboss
ENV JWS_HOME /opt/webserver

WORKDIR /home/jboss
USER jboss

EXPOSE 8080

CMD ["usage"]
