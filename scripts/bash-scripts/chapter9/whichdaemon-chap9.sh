#!/usr/bin/env bash
set -u

while true; do
echo
echo "Please make a choice on what you want to look up [1-7]"
echo
cat << CHOICE
1. Restic
2. SSH server
3. Systemd resolved 
4. Systemd Timesync
5. Systemd logind
6. Choose another service
7. Exit program
CHOICE

read choice

case $choice in
	1)
		if ps aux | grep "restic" | grep -v "grep" > /dev/null; then
			echo
			ps aux | grep "restic" | grep -v "grep" | awk	'{print "User: " $1
									  print	"CPU Usage: " $3
									  print "MEM Usage: " $4
									  print "START: " $9
									  print "COMMAND: " $11
									}'
			echo 
		else
			echo
			echo "No restic process is running"
		fi 
		;;

	2)
		if ps aux | grep "SSH" | grep -v "grep" > /dev/null; then
			echo
			ps aux | grep "SSH" | grep -v "grep" | awk	'{print "User: " $1
									  print	"CPU Usage: " $3
									  print "MEM Usage: " $4
									  print "START: " $9
									  print "COMMAND: " $11
									}'
			echo 
		else
			echo
			echo "No SSH process is running"
		fi 
		;;

	3)
		if ps aux | grep "systemd-resolved" | grep -v "grep" > /dev/null; then
			echo
			ps aux | grep "systemd-resolved" | grep -v "grep" | awk	'{print "User: " $1
									  print	"CPU Usage: " $3
									  print "MEM Usage: " $4
									  print "START: " $9
									  print "COMMAND: " $11
									}'
			echo 
		else
			echo
			echo "No systemd-resolved process is running"
		fi 
		;;

	4)
		if ps aux | grep "systemd-timesyncd" | grep -v "grep" > /dev/null; then
			echo
			ps aux | grep "systemd-timesyncd" | grep -v "grep" | awk	'{print "User: " $1
									  print	"CPU Usage: " $3
									  print "MEM Usage: " $4
									  print "START: " $9
									  print "COMMAND: " $11
									}'
			echo 
		else
			echo
			echo "No systemd-timesyncd process is running"
		fi 
		;;

	5)
		if ps aux | grep "systemd-logind" | grep -v "grep" > /dev/null; then
			echo
			ps aux | grep "systemd-logind" | grep -v "grep" | awk	'{print "User: " $1
									  print	"CPU Usage: " $3
									  print "MEM Usage: " $4
									  print "START: " $9
									  print "COMMAND: " $11
									}'
			echo 
		else
			echo
			echo "No systemd-logind process is running"
		fi 
		;;

	6)
		echo "Tell me which service you want to look up: "
		read service
		if ps aux | grep "$service" | grep -v "grep" > /dev/null; then
			echo
			ps aux | grep "$service" | grep -v "grep" | awk	'{print "User: " $1
									  print	"CPU Usage: " $3
									  print "MEM Usage: " $4
									  print "START: " $9
									  print "COMMAND: " $11
									}'
			echo 
		else
			echo
			echo "No $service process is running"
		fi 
		;;
	7)
		echo
		echo "exiting program..."
		sleep 1
		exit 0
		;;

	[Aa-Öö])
		echo "Dont choose a character you fucking idiot"
		;;
	*)
		echo
		echo "invalid choice, please make a choice between 1-6"

	esac
done
