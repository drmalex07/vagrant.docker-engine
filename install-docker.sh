#!/bin/bash

apt-get install -y apt-transport-https ca-certificates gnupg2 software-properties-common

# Add APT key for Docker repositories
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

# Add APT repositories for Docker; update cache
add-apt-repository "deb https://download.docker.com/linux/debian jessie stable"
apt-get update

# Install docker CE
apt-get install -y docker-ce
docker run hello-world

# Make current user capable to interact with docker daemon
adduser vagrant docker
