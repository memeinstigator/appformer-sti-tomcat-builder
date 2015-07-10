IMAGE_NAME = docker.io/memeinstigator/s2i-tomcat-builder

build:
		docker build -t $(IMAGE_NAME) .
