#!/usr/bin/env bash

echo "Creating an ISO file..."

dd if=/dev/zero of=dummy.iso bs=1G count=10 &
PID=$!

trap "echo This action will make the ISO file unsuable!" SIGINT SIGTERM
while kill -0 $PID; do
	wait $PID
done
trap - SIGINT SIGTERM

echo "ISO file done..."
