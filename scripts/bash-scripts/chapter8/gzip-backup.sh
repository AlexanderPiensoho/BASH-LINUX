#!/usr/bin/env bash

#This script does a very simple test for checking disk space.


BACKUP_DIR=~/
ARCHIVED_DIR=~/backups/
BACKUP_FILE=ubuntu-backup.tar.gz
TARGET_PATH=$ARCHIVED_DIR$BACKUP_FILE
REMOTE_SERVER=fedora
REMOTE_DIR=/home/alexander/ziped-backups


if [[ -f $TARGET_PATH ]]; then
       rm -rf $TARGET_PATH 
fi
	
tar -czf $TARGET_PATH $BACKUP_DIR

        echo "The gziped tar file is now saved at $ARCHIVED_DIR"

	echo "I will now send $BACKUP_FILE to $REMOTE_SERVER in $REMOTE_DIR"

if [[ -f $TARGET_PATH ]]; then
	scp -r $TARGET_PATH $REMOTE_SERVER:$REMOTE_DIR >> ~/log/homebackup.log
	rm $TARGET_PATH
fi
