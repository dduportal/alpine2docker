# alpine2docker Vagrant Box

This repository contains the scripts necessary to create a lightweight Vagrant box for running docker, based on [Alpine Linux OS](https://alpinelinux.org/).

If you work solely with Docker, this box lets you keep your Vagrant workflow and work in the most minimal Docker environment possible.

## Usage

The box is available on [Hashicorp's Atlas](https://atlas.hashicorp.com/dduportal/boxes/alpinedocker), making it very easy to use it:

    $ vagrant init dduportal/alpine2docker
    $ vagrant up

## [What's in the box ?](https://www.youtube.com/watch?v=1giVzxyoclE)

* Guest OS: Alpine Linux 3.5
* LVM root filesystem for any filesystem growing allocation
* 1 Gb swap enabled
* Default to NAT network
* Default to 2 vCPUs and 4 Gb memory
* OpenSSH server
* Bash, curl, sudo
* Administrative user *alpine* (password is the same)
* Docker Engine 1.13.0
* Docker Compose 1.10.0
* Docker Bash Completion
* *NOT in the box:*
  - No VirtualBox addition (meaning: no shared filesystem with the host)
  - No USB
  - No Audio


## Building the Box

If you want to recreate the box, rather than using the binary, then
you can use the scripts and Packer template within this repository to
do so in seconds.

### Requirements

* [Make as workflow engine](http://www.gnu.org/software/make/)
* [Packer as vagrant basebox builder](http://www.packer.io) (at least version 0.12.2)
* [Vagrant](http://vagrantup.com) (at least version 1.8.5)
* [VirtualBox](http://www.virtualbox.org) (at least version 5.1.12)
* [bats for testing](https://github.com/sstephenson/bats)

### Building the box

Then run this command to build the box and run the test suite:

```
make all
```

You can also run the make targets independently
for a quick feedback loop:

* `make box`: Only run the packer build
* `make clean-box`: Remove any packer final or intermediate artifacts
* `make prepare-test`: Copy the latest built box to the test environement
* `make test`: Run the test suite using vagrant
* `make clean-test`: Clean any test artifacts or VM
* `make clean`: Clean everything
