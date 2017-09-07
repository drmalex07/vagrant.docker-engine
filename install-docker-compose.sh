#!/bin/bash

DOCKER_COMPOSE_VERSION=1.16.1

download_url="https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)"
curl -fsSL "${download_url}" -o /usr/local/bin/docker-compose
if [ "$?" -eq "0" ]; then
    chmod +x /usr/local/bin/docker-compose
    exit 0
else
    exit 1
fi
