#!/usr/bin/env bash

if [[ $(id -u) -ne 0 ]]; then
    echo "run this as root"
    exit 1
fi

./users_and_groups.sh
./system-setup.sh
./install-docker.sh

echo "Done configuring config!"
