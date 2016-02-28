OS := ubuntu
VER := 14.04
TYPE := docker
DATE := $(shell date +%Y%m%d)

help:
	@echo
	@echo "Usage:"
	@echo
	@echo "    make build|test|clean"
	@echo

build:
	@packer build \
		-var version=$(DATE).0.0 \
		-var-file=$(OS)-$(VER)/variables/$(TYPE).json \
		$(OS)-$(VER)/template.json
test:
	@vagrant box add \
		boxes/$(OS)-$(TYPE)-$(DATE).0.0.virtualbox \
		--name $(OS)-$(TYPE) \
		--force
	@mkdir -p boxes/test-$(OS)-$(TYPE)
	@cd boxes/test-$(OS)-$(TYPE); \
		vagrant init $(OS)-$(TYPE); \
		vagrant up; \
		vagrant ssh; \
		vagrant halt; \
		vagrant destroy
	@rm -rf boxes/test-$(OS)-$(TYPE)
clean:
	@rm -rf boxes/test-*
	@rm -rf output-*

.SILENT:
