#!/usr/bin/env bash
#This script setups the needed files to get started with the restic automated backup.
#After you have run this script you need to init you restic repo and add the password to the passwd-restic file.
set -u

SYSTEMD_PATH="/etc/systemd/system"
USER=$(whoami)
SCRIPT_DIR=$(pwd)

	if [[ ! -f $SYSTEMD_PATH/restic.timer ]]; then
		echo "creating restic.timer file in $SYSTEMD_PATH..."

		sudo tee $SYSTEMD_PATH/restic.timer > /dev/null <<TIMER
[Unit]
Description=Backup system with restic 5 mins after boot

[Timer]
OnBootSec=5min
Unit=restic.service

[Install]
WantedBy=timers.target
TIMER
	fi

	if [[ ! -f $SYSTEMD_PATH/restic.service ]]; then
		echo "creating restic.service file in $SYSTEMD_PATH..."

		sudo tee $SYSTEMD_PATH/restic.service > /dev/null <<SERVICE
[Unit]
Description="Backup based on restic.timer trigger"

[Service]
Type=simple
ExecStart=$SCRIPT_DIR/restic.sh
User=$USER
SERVICE
	fi

	if [[ ! -f $SCRIPT_DIR/passwd-restic ]]; then
		echo "creating passwd-restic file in $SCRIPT_DIR, make sure to add your password there later"
		touch $SCRIPT_DIR/passwd-restic
	if [[ ! -f $SCRIPT_DIR/.gitignore ]];then
		echo "adding .gitignore and adding passwd-restic file..."
		tee -a $SCRIPT_DIR/.gitignore <<PASSWD
passwd-restic
PASSWD
	fi
	fi


echo "I will now reload daemon and enable the timer..."
sudo systemctl daemon-reload
sudo systemctl enable --now restic.timer
sudo systemctl status restic.timer

