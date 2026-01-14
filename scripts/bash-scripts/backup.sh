#!/usr/bin/bash
#
#This scripts saves that files in /home/alexander/scripts/test-data as backups.

echo "I will now backup all the files in /home/alexander/scripts/test-data directory..."
echo
BACKUP_DIR="/home/alexander"
SOURCE_DIR="/home/alexander/scripts/test-data"
DATE=$(date +%F)

tar -czf $BACKUP_DIR/backup_$DATE.tar.gz $SOURCE_DIR

echo "Backup done!"

