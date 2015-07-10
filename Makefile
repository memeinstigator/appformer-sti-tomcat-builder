IMAGE_NAME = memeinstigator/s2i-tomcat-builder

build:
		docker build -t $(IMAGE_NAME) .
