IMAGE_NAME = memeinstigator/s2i-tomcat

build:
		docker build -t $(IMAGE_NAME) .
