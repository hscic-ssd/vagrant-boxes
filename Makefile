OS_NAME := ubuntu
OS_VER := 14.04
TYPE :=

BOX_NAME := $(OS_NAME)-$(TYPE)
BOX_VER := $(OS_VER).$(shell date +%Y%m%d)
BOX_PROVIDER := virtualbox

help:
	@echo
	@echo "Usage:"
	@echo
	@echo "    make build [OS_NAME=name] [OS_VER=version] [TYPE=type]"
	@echo "    make test [OS_NAME=name] [OS_VER=version] [TYPE=type]"
	@echo "    make clean"
	@echo

build:
	@if [ "$(TYPE)" = "" ]; then \
		packer build -var version=$(BOX_VER) \
			$(OS_NAME)-$(OS_VER)/template.json; \
	else \
		packer build -var version=$(BOX_VER) \
			-var-file=$(OS_NAME)-$(OS_VER)/$(TYPE).json \
			$(OS_NAME)-$(OS_VER)/template.json; \
	fi
test:
	@vagrant box add \
		boxes/$(BOX_NAME)-$(BOX_VER)-$(BOX_PROVIDER).box \
		--name $(BOX_NAME) \
		--force
	@mkdir -p boxes/test-$(BOX_NAME)-$(BOX_VER)
	@cd boxes/test-$(BOX_NAME)-$(BOX_VER); \
		vagrant init $(BOX_NAME); \
		vagrant up; \
		vagrant ssh; \
		vagrant halt; \
		vagrant destroy
	@rm -rf boxes/test-$(BOX_NAME)-$(BOX_VER)
clean:
	@rm -rf boxes/test-*
	@rm -rf output-*

.SILENT:
