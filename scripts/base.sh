#!/bin/sh
set -uxe

# Update system
apk upgrade -U --available

# Install base packages
apk add curl bash bash-completion

# Configure root to use bash
sed -i 's#/ash#/bash#g' /etc/passwd
