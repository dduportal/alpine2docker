#!/bin/sh

set -eux -o pipefail

uptime && date

#### Configure System to handle Docker capabilities

# Enable swap accounting for containers
sed -i 's/quiet/quiet cgroup_enable=memory swapaccount=1/' /boot/extlinux.conf


### Install Docker
apk --no-cache add docker docker-bash-completion

service docker stop
addgroup root docker
addgroup "${BASE_USER}" docker
service docker start
rc-update add docker boot

### Install Docker-compose
apk add --no-cache py3-pip py3-paramiko
pip3 install --no-cache-dir --upgrade pip
pip3 install --no-cache-dir "docker-compose==1.24.0"

### Reboot now
reboot now
exit 0
