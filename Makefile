VERSION=3.11.6
GOBUILD=go build .
DOCKER_USER=stevelacy
NAME=alpine-ca
IMAGE=$(DOCKER_USER)/$(NAME):$(VERSION)
LATEST=$(DOCKER_USER)/$(NAME):latest

all: docker

docker:
	docker build -t $(IMAGE) .
	docker tag $(IMAGE) $(LATEST)

push:
	docker push $(IMAGE)
	docker push $(LATEST)
