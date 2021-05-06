# A tool to monitor the local area network (LAN) "*/24" network using ARP.

DOCKERHUB_ID:=ibmosquito
NAME:="web-hello-python"
VERSION:="1.0.0"

default: build run

build:
	docker build -t $(DOCKERHUB_ID)/$(NAME):$(VERSION) .

dev: stop build
	docker run -it -v `pwd`:/outside \
          --name ${NAME} \
          -p 8000:8000 \
          $(DOCKERHUB_ID)/$(NAME):$(VERSION) /bin/bash

run: stop
	docker run -d \
          --name ${NAME} \
          --restart unless-stopped \
          -p 8000:8000 \
          $(DOCKERHUB_ID)/$(NAME):$(VERSION)

test:
	@curl -sS http://127.0.0.1:8000

push:
	docker push $(DOCKERHUB_ID)/$(NAME):$(VERSION) 

stop:
	@docker rm -f ${NAME} >/dev/null 2>&1 || :

clean:
	@docker rmi -f $(DOCKERHUB_ID)/$(NAME):$(VERSION) >/dev/null 2>&1 || :

.PHONY: build dev run push test stop clean
