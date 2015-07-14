IMAGE_NAME = appformer-sti-tomcat-builder

build:
		docker build -t $(IMAGE_NAME) .
