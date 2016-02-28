DIR := $(shell pwd)
OS := ubuntu-14.04

help:
	@echo
	@echo "Usage:"
	@echo
	@echo "    make build|test|clean"
	@echo

build:
	@packer build \
		-var version=$(shell date +%Y%m%d).0.0 \
		-var-file=ubuntu-14.04/variables/docker.json \
		ubuntu-14.04/template.json
test:
	@vagrant box add \
		boxes/ubuntu-docker-$(shell date +%Y%m%d).0.0.virtualbox \
		--name ubuntu-docker \
		--force
	@rm -rf boxes/test
	@mkdir -p boxes/test
	@cd boxes/test; \
		vagrant init ubuntu-docker; \
		vagrant up; \
		vagrant ssh; \
		vagrant halt; \
		vagrant destroy
	@rm -rf boxes/test
clean:
	@rm -rf boxes/test
	@rm -rf $(DIR)/output-*

.SILENT:
