#!/bin/sh

cat <<EOF
This is a STI tomcat7 base image responsible for consuming a JEE project
and deploying it onto tomcat7 server.


To use it, install STI: https://github.com/openshift/source-to-image.

Sample invocation:
sti build git://github.com/appPackage memeinstigator/s2i-tomcat-builder tomcat7
You can then run the resulting image via:
docker run -p 8080:8080 tomcat7



Details:

If a pom.xml is present in the source directory, the project is built with maven and the
output in target will be copied into the tomcat7 deployments directory. /opt/webserver/webapps

If war files are present in <src>/target or <src>/deployments they will be copied
into the tomcat7 deployments directory as is.

Tomcat7 configuration can be overridden by supplying files in <src>/conf, these files
will be copied into /opt/webserver/config.

Maven build arguments can be overridden by setting MAVEN_ARGS via the "--env" argument to STI

EOF