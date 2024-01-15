DOCKER_IMAGE_VERSION=$(git )
DOCKER_IMAGE_NAME=ksonney/freeboard-mqtt
DOCKER_IMAGE_TAGNAME=$(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_VERSION)

default: build

build: 
	docker buildx build --load -t $(DOCKER_IMAGE_TAGNAME)  .

run: build
	docker run --rm -p 8080:8080 $(DOCKER_IMAGE_TAGNAME) &

push:
	docker buildx build --push --platform linux/aarch64,linux/arm64/v8,linux/amd64 -t $(DOCKER_IMAGE_TAGNAME) .
	docker tag $(DOCKER_IMAGE_TAGNAME) $(DOCKER_IMAGE_NAME):latest
	docker push $(DOCKER_IMAGE_NAME):latest
