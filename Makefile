NAME = krkr/dops
VERSION = 0.1.0

build: build-base-image build-image

build-base-image:
	@echo "Build $(NAME)-base:latest..."
	docker build --rm -t $(NAME)-base:latest  -f Dockerfile.base .

build-image:
	@echo "Build $(NAME):latest..."
	docker build --rm -t $(NAME):latest .

release: tag push

tag:
	docker tag -f $(NAME):latest $(NAME):$(VERSION)

push:
	docker push $(NAME)

#

go:
	docker run --rm -ti \
		-v $$(pwd):/ops \
		-e MACHINE_STORAGE_PATH=/ops/machines \
		$(NAME):latest

test:
	@docker run --rm $(NAME):latest whichversion curl
	@docker run --rm $(NAME):latest whichversion jq
	@docker run --rm $(NAME):latest whichversion bash
	@docker run --rm $(NAME):latest whichversion terraform
	@docker run --rm $(NAME):latest whichversion docker
	@docker run --rm $(NAME):latest whichversion docker-machine
	@docker run --rm $(NAME):latest whichversion docker-compose
	@docker run --rm $(NAME):latest whichversion ansible
