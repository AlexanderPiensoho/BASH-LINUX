#!/usr/bin/env bash
set -u

SYSTEMD_PATH="/etc/systemd/system"
USER=$(whoami)
SCRIPT_DIR="/home/alexander/systemd-restic-timer"
SERVER="fedora"
SERVER_PATH="/home/alexander/systemd-restic-timer"

passwd_file=$SCRIPT_DIR/passwd-restic
restic -p $passwd_file -r sftp:$SERVER:$SERVER_PATH cat config > /dev/null

if [[ $? -eq 0 ]]; then 
	echo "Restic repo already exists i will only make another snapshot"
	restic -p $passwd_file -r sftp:$SERVER:$SERVER_PATH --verbose backup ~/scripts/
else
	echo "initalating repo..."
	restic -p $passwd_file -r sftp:$SERVER:$SERVER_PATH init
	restic -p $passwd_file -r sftp:$SERVER:$SERVER_PATH --verbose backup ~/scripts/

fi

echo "I will now make sure everything is looking good"
restic check -p $passwd_file  -r sftp:$SERVER:$SERVER_PATH

