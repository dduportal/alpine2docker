#!/bin/sh
#
# This script is an example of customization script
# for https://github.com/dduportal/alpine2docker
# It will print the date to a file inside the VM root home

MY_BASE_DIR="$(pwd -P)"

# File comes from the packer copied content
cp "${MY_BASE_DIR}/example.tpl" /root/

# We append the date in the file
date +"%Y-%m-%d %H:%M:%S" | sudo tee -a /root/customized_build_date
