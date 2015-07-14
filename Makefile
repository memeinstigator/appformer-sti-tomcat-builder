IMAGE_NAME = my-tomcat8-sti-builder

build:
		docker build -t $(IMAGE_NAME) .
