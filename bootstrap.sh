#!/bin/bash

#
# Update APT index; install basic packages
#

apt-get update
apt-get install -y vim bash-completion sudo curl htop tree bzip2 p7zip-full

#
# Set hostname
#

if [ -z "${MACHINE_HOSTNAME}" ]; then
    echo "A name must be specified for MACHINE_HOSTNAME" 2>&1
    exit 1;
fi

echo "${MACHINE_HOSTNAME}" > /etc/hostname
sed --in-place -e 's/^\(127.0.1.1\)\s\+\([-a-z0-9.]*\)/\1 '"${MACHINE_HOSTNAME}"'/' /etc/hosts

#
# Create directory structure
#

mkdir ~/bin

exit 0
