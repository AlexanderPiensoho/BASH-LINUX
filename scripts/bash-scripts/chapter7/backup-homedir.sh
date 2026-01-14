#!/usr/bin/env bash

date=$(date "+%Y-%m-%d_%H:%M")
echo "The script will now backup the homedirectory and save it on the fedora server..."


if (( $? == 0 )); then
	scp -r $HOME fedora:~/ubuntu_backup_$date >> ~/log/homebackup.log
	echo "$date Backup succesefully saved on fedora server" >> ~/log/homebackup.log
	echo "The backup is succesfully saved see ~/log/homebackup.log for more information"
else 
	echo "$date Backup failed to save on fedora server" >> ~/log/homebackup.log
	echo "The backup failed see ~/log/homebackup.log for more information"
fi

