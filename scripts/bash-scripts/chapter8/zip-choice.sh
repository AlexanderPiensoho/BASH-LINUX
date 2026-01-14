#!/usr/bin/env bash

#This script will give the user the choice to gzip the file or not when backing up

echo "These are the choices you can make when backing up your files"

cat << CHOICES
1.gzip the backup
2.don't gzip the backup
3.exit program
CHOICES

echo -n "Make a choice from 1-3: "

read -n  1 choice

echo -e "\nYou chose $choice, i will now execute your choice..."

if [[ $choice -eq 1 ]]; then
	/home/alexander/scripts/bash-scripts/chapter7/backup-homedir.sh
	echo "Backup is gziped and saved on fedora-server!"
	exit 0
elif [[ $choice -eq 2 ]]; then
	/home/alexander/scripts/bash-scripts/chapter8/gzip-backup.sh
	echo "Backup is saved on fedora-server!"
	exit 0
else
	echo "Exiting program..."
	exit 0 
fi

