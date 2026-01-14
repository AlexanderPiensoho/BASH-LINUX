#!/usr/bin/env bash

set -u
backup_dir=~/
date=$(date +%F%H%M)
backup_file=backup.$date.tar.gz
target_space=/var/backups/
target_dir=$target_space$backup_file

if [[ $# -ne 0 ]];then
	echo "You are not allowed to use arguments"
	exit 1
fi

avail_space=$(sudo df -B 1 --output=avail "$target_space" | tail -1)
backup_size=$(du -s --one-file-system --bytes "$backup_dir" | awk '{print $1}')
can_backup=$(( backup_size * 2 )) 

if [[ $can_backup -ge $avail_space ]]; then
	echo "Backup size too big, cant make a backup"
	exit 1
fi

echo "Which type of backup do you want to do?"

cat << CHOICES
1. Full backup
2. Incremental backup
CHOICES

read -n 1 choice

if [[ $choice -eq "1" ]]; then
	echo "You choose full backup"
	sudo tar -czvpf $target_dir $backup_dir 
	echo "$backup_dir is now saved at $target_dir."
	exit 0

elif [[ $choice -eq "2" ]]; then
	echo "You choose incremental backup"
	#Jag lyckas inte med incremental -g ska göra det, men har nog fel argument?
	sudo tar -czgvpf $target_dir $backup_dir
	echo "The incremental backups is now done"
	exit 0

else
	echo "invalid choice"
	exit 2

fi
