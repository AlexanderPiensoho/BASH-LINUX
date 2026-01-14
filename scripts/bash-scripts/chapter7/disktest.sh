#!/usr/bin/env bash

#This script does a very simple test for checking disk space.


BACKUP_DIR=~/scripts/test-data
ARCHIVED_DIR=~/
BACKUP_FILE=backup_test.data.tar.gz
TARGET_PATH=$ARCHIVED_DIR$BACKUP_FILE
REMOTE_SERVER=fedora
REMOTE_DIR=/home/alexander/ziped-backups

space=`df -h | awk '{print $5}' | grep % | grep -v Use | sort -n | tail -1 | cut -d "%" -f1`

case $space in
	[1-9])
		#ska checka hur mycket diskspace som finns tillgängligt
		#filen som ska backas upp hur mycket space den tar
		#backupfilen*2.5
		Message="Disk usage is below $space %"
		if (( space >= 95 && space <=99 )); then
			echo "To much space is used, can't zip file. You need to clean up some space first!"
			exit 1 
		fi

                echo "I will now archive everything in $BACKUP_DIR"

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
		;;

	[1-6]*)
		Message="All is quiet."
		;;

	[7-8]*)
		Message="Start thinking about cleaning out some stuff. There's a partition that is $space % full"
		;;

	9[1-8]*)
		Message="Better hurry with that new disk... One partition is $space % full."
		;;

	90)
		echo "Disk usage is now exatly $space %..."
		echo "I will now archive everything in $BACKUP_DIR"

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
		;;

	99)
		Message="I'm drowning here! There's a partition at $space %!!!"
		;;

	*)
		Message="I seem to be running with an nonexistent amount of disk space..."
		;;
esac

echo $Message

