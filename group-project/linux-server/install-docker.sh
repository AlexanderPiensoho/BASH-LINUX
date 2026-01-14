#!/usr/bin/env bash

if [[ $(id -u) -ne 0 ]]; then
    echo "root required for this"
    exit 2
fi

if ! docker ps &> /dev/null; then
    echo "no docker"
    exit 1
fi

docker build -t socket-listener:latest .

systemd_dir="/etc/systemd/system"
bin_dir="/usr/local/bin"

ln -s "$PWD/socket-listener.service" $systemd_dir/
ln -s "$PWD/run-docker.sh" $bin_dir/

touch /var/log/socket-listener.log
systemctl enable --now socket-listener.service
