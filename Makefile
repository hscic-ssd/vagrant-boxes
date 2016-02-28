DIR := $(shell pwd)

help:
	@echo
	@echo "Usage:"
	@echo
	@echo "    make clean|build"
	@echo

build:
	@packer build -var version=$(shell date +%Y%m%d).0.0 -var-file=ubuntu-docker.json ubuntu.json
test:
	@vagrant box add \
		build/ubuntu-docker-$(shell date +%Y%m%d).0.0.virtualbox \
		--name ubuntu-docker \
		--force
	@cd build; rm -rf vm; mkdir vm; cd vm; \
		vagrant init ubuntu-docker; \
		vagrant up; \
		vagrant ssh; \
		vagrant halt; \
		vagrant destroy
clean:
	@rm -rf $(DIR)/build/*.virtualbox
	@rm -rf $(DIR)/output-*

.PHONY: build
.SILENT:
