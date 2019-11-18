#!/bin/bash

set -eux -o pipefail

uptime && date

adduser -s /bin/bash -D "${BASE_USER}"
echo "${BASE_USER}:${BASE_USER}" | chpasswd

SSH_USER_DIR="/home/${BASE_USER}/.ssh"

mkdir -p 700 "${SSH_USER_DIR}"

curl -Lso "${SSH_USER_DIR}/authorized_keys" \
  'https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub'

chmod -R go-rwsx "${SSH_USER_DIR}"
chown -R "${BASE_USER}:${BASE_USER}" "${SSH_USER_DIR}"
