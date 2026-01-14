#!/usr/bin/env bash

PORT="5555"

echo "listening on port: $PORT"
exec /usr/bin/nc -lk -p $PORT >> /socket-listener.log
