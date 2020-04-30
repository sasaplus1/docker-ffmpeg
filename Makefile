.DEFAULT_GOAL := all

SHELL := /bin/bash

makefile := $(abspath $(lastword $(MAKEFILE_LIST)))
makefile_dir := $(dir $(makefile))

.PHONY: all
all: ## output targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(makefile) | awk 'BEGIN { FS = ":.*?## " }; { printf "\033[36m%-30s\033[0m %s\n", $$1, $$2 }'

.PHONY: build
build: export DOCKER_BUILDKIT=1 COMPOSE_DOCKER_CLI_BUILD=1
build: ## build Docker images
	docker-compose build --no-cache --parallel

.PHONY: help
help: ## output how to run
	@echo 'docker run --rm -v "$$PWD:/tmp" sasaplus1/docker-ffmpeg'
