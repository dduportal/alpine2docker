
BOX_VERSION := 1.1.0
BOX_NAME := alpine2docker
BOX_FILE := $(BOX_NAME)-$(BOX_VERSION).box
BOX_TEST := $(BOX_NAME)-test
TEST_DIR := ./tests

all: clean box prepare-test test

clean: clean-test clean-box

box: $(BOX_FILE)

$(BOX_FILE):
	packer build -var 'BOX_VERSION=$(BOX_VERSION)' $(BOX_NAME).json

prepare-test:
	vagrant box add --force $(BOX_TEST) $(BOX_FILE)
	cd $(TEST_DIR) && vagrant init -f -m $(BOX_TEST)

test:
	cd $(TEST_DIR) && bats ./*.bats

clean-test:
	cd $(TEST_DIR) && vagrant destroy -f || true
	cd $(TEST_DIR) && rm -rf Vagrantfile .vagrant
	vagrant box remove $(BOX_TEST) || true
	vagrant global-status --prune

clean-box:
	rm -rf output* $(BOX_FILE)
	rm -rf "$(HOME)/VirtualBox VMs/$(BOX_NAME)"

.PHONY: box prepare-test test all clean clean-test clean-box
