#!/bin/bash

mkdir -p /etc/systemd/system/docker.socket.d/

cat >/etc/systemd/system/docker.socket.d/10-socket.conf <<EOD
[Socket]
ListenStream=${LISTEN_ADDRESS}:2375
EOD

systemctl daemon-reload
systemctl restart docker.service
