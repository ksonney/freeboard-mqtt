DOCKER_IMAGE_VERSION=1.0
DOCKER_IMAGE_NAME=talmai/freeboard-mqtt
DOCKER_IMAGE_TAGNAME=$(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_VERSION)

default: build

build: 
	docker build -t $(DOCKER_IMAGE_TAGNAME) .
	docker tag $(DOCKER_IMAGE_TAGNAME) $(DOCKER_IMAGE_NAME):latest

run: build
	docker run --rm -p 8080:8080 $(DOCKER_IMAGE_TAGNAME) &

push: build
	docker push $(DOCKER_IMAGE_TAGNAME)
	docker push $(DOCKER_IMAGE_NAME):latest