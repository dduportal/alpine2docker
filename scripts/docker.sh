#!/bin/sh
set -eux

# Install Docker
echo 'http://dl-cdn.alpinelinux.org/alpine/edge/community' \
    | tee -a /etc/apk/repositories
apk update

apk add docker="${DOCKER_VERSION}-r0"

service docker stop
addgroup root docker
addgroup "${BASE_USER}" docker
service docker start
rc-update add docker boot

# Install Docker-compose
apk add py-pip
pip install --no-cache-dir --upgrade pip
pip install --no-cache-dir "docker-compose==${COMPOSE_VERSION}"

# Docker bash completions
apk add docker-bash-completion
