
export BOX_VERSION ?= 1.8.1
export VM_CPUS ?= 1
export VM_MEMORY ?= 1024
BOX_BASENAME ?= alpine2docker
BOX_NAME ?= $(BOX_BASENAME)-$(BOX_VERSION)
export BOX_FILE ?= $(BOX_NAME).box
BOX_TEST ?= $(BOX_BASENAME)-test
TEST_DIR ?= ./tests

all: clean box prepare-test test

clean: clean-test clean-box

box: $(BOX_FILE)

$(BOX_FILE):
	packer build -var 'BOX_VERSION=$(BOX_VERSION)' $(BOX_BASENAME).json

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
	rm -rf "$(HOME)/VirtualBox VMs/$(BOX_BASENAME)"

.PHONY: box prepare-test test all clean clean-test clean-box
