#!/bin/bash

set -eux -o pipefail

uptime && date

#### Configure System to handle Docker capabilities

# Enable swap accounting for containers
sed -i 's/quiet/quiet cgroup_enable=memory swapaccount=1/' /boot/extlinux.conf


### Install Docker and Compose
apk --no-cache add docker docker-bash-completion docker-compose

service docker stop
addgroup root docker
addgroup "${BASE_USER}" docker
service docker start
rc-update add docker boot

### Reboot now
reboot now
exit 0
