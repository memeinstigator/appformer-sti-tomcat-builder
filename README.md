<h1>Red Hat OpenShift Project<h1>

This project builds an STI tomcat builder image for use in Redhat OpenShift 3 environment.

Get project code

$ git pull https://github.com/memeinstigator/appformer-sti-tomcat-builder

$ cd appformer-sti-tomcat-builder
 
Install make, if you don't have it. "yum -y install make"

$ make

You should have "appformer-sti-tomcat-builder" created in local docker repository

$ docker images

should have the following image appformer-sti-tomcat-builder
 
(OPTIONAL)
Once you are happy with the builder, you can push it to central docker registry for others to use in their STI build proces
docker.oi/memeinstigator/s2i-tomcat-builder

$ docker tag appformer-sti-tomcat-builder docker.io/memeinstigator/appformer-sti-tomcat-builder

$ docker push docker.io/memeinstigator/appformer-sti-tomcat-builder

See sti/usage/README.md for usage
