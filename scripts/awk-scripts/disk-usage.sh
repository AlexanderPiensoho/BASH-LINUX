#!/usr/bin/bash

echo "Hello, the script will now show you the top 3 users with most storage used..."
echo

sudo du -sh /home/* | sort -rh | head -n 3 | awk '{print "User: " $2 " Usage: " $1 }'>result

cat result
echo
echo "I will now email the information to $USER"

mail -s "Disk space usage" $USER <result
