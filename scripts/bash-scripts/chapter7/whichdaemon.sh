#!/usr/bin/env bash
#This script checks if a httpd and systemd is running

echo "Hello, the script will now check for httpd and systemd"
sleep 1
echo 
if ps -ef | grep "httpd" | grep -v "grep" > /dev/null; then 
       echo "This machine has a httpd running"
else 
	echo "No httpd process was found"
fi
echo 
if ps -ef | grep "systemd" | grep -v "grep" > /dev/null; then
	echo "Systemd is running"
else
	echo "No systemd is running"
fi 
