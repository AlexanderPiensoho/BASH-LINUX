#!/usr/bin/env bash

NAME='socket-listener'

if docker ps | grep "socket-listener"; then
    docker stop "$NAME"
fi

docker run -d --rm --name $NAME -p 5555:5555 -v /var/log/socket-listener.log:/socket-listener.log socket-listener:latest
