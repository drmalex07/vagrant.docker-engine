#!/bin/bash

DOCKER_COMPOSE_VERSION=1.16.1

download_url=https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)
curl -L ${download_url} > ~/bin/docker-compose

if [ -z "$?" ]; then
    chmod +x ~/bin/docker-compose
    exit 0
else
    exit 1
fi
