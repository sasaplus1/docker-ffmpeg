.DEFAULT_GOAL := all

SHELL := /bin/bash

makefile     := $(abspath $(lastword $(MAKEFILE_LIST)))
makefile_dir := $(dir $(makefile))

tag := docker-ffmpeg

.PHONY: all
all: ## output targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(makefile) | awk 'BEGIN { FS = ":.*?## " }; { printf "\033[36m%-30s\033[0m %s\n", $$1, $$2 }'

.PHONY: build
build: ## build Docker image
	DOCKER_BUILDKIT=1 docker build -t $(tag) .

.PHONY: run
run: options := --interactive --rm --tty --volume $$(pwd)/share:/root/share
run: ## run Docker container and attach TTY
	docker run $(options) $(tag) bash
