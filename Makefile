
BOX_VERSION ?= 1.10.0

TEST_DIR ?= $(CURDIR)/tests
DIST_DIR ?= $(CURDIR)/dist

BOX_BASENAME ?= alpine2docker
BOX_NAME ?= $(BOX_BASENAME)-$(BOX_VERSION)
BOX_FILE ?= $(DIST_DIR)/$(BOX_NAME).box
BOX_TEST ?= $(BOX_BASENAME)-test

export BOX_VERSION BOX_FILE

all: clean box prepare-test test

clean: clean-test clean-box

box: $(BOX_FILE)
	sha512sum $(BOX_FILE) > $(DIST_DIR)/shasum512-$(BOX_VERSION)

$(DIST_DIR):
	mkdir -p $(DIST_DIR)

$(BOX_FILE): $(DIST_DIR)
	packer build -var 'BOX_VERSION=$(BOX_VERSION)' $(BOX_BASENAME).json

prepare-test:
	vagrant box add --force $(BOX_TEST) $(BOX_FILE)
	cd $(TEST_DIR) && vagrant init -f -m $(BOX_TEST)

test:
	cd $(TEST_DIR) && bats $(TEST_DIR)/*.bats

clean-test:
	cd $(TEST_DIR) && vagrant destroy -f || true
	cd $(TEST_DIR) && rm -rf Vagrantfile .vagrant
	vagrant box remove $(BOX_TEST) || true
	vagrant global-status --prune

clean-box:
	rm -rf $(DIST_DIR) "$(HOME)/VirtualBox VMs/$(BOX_BASENAME)"

.PHONY: box prepare-test test all clean clean-test clean-box
