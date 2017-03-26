#!/bin/sh
set -eux

apk --update --no-cache add sudo
adduser "${BASE_USER}" wheel

echo "Defaults exempt_group=wheel" > /etc/sudoers
echo "%wheel ALL=NOPASSWD:ALL" >> /etc/sudoers
