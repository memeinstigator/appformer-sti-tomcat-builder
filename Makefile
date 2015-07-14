IMAGE_NAME = AppFormer-tomcat-sti-builder

build:
		docker build -t $(IMAGE_NAME) .
