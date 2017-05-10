#!/bin/sh

set -eux -o pipefail

uptime && date

#### Configure System to handle Docker capabilities

# Make PAX in softmode - example for container with JVM
cat <<EOF >/etc/sysctl.d/10-docker.conf
kernel.pax.softmode=1
EOF

# Enable swap accounting for containers
sed -i 's/quiet/quiet cgroup_enable=memory swapaccount=1/' /boot/extlinux.conf


### Install Docker
echo 'http://dl-cdn.alpinelinux.org/alpine/edge/community' \
    | tee -a /etc/apk/repositories

apk --no-cache add docker py-pip docker-bash-completion

service docker stop
addgroup root docker
addgroup "${BASE_USER}" docker
service docker start
rc-update add docker boot

### Install Docker-compose
pip install --no-cache-dir --upgrade pip
pip install --no-cache-dir "docker-compose"

### Reboot now
reboot now
sleep 30
exit 0
