DIR := $(shell pwd)

help:
	@echo
	@echo "Usage:"
	@echo
	@echo "    make build|clean"
	@echo

build:
	@packer build -var version=$(shell date +%Y%m%d).0.0 -var-file=ubuntu-docker.json ubuntu.json
clean:
	@rm -rf $(DIR)/box/virtualbox/*.box

.SILENT:
