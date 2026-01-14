#!/usr/bin/env bash
#Takes 1 argument [user they want to add] and looks up next avaible ID and GID
#Also creates a private group for the user

set -u

#handles user IDs
lastID=$(awk -F: '{print $3}' /etc/passwd | grep -v 65534 | sort -n | tail -1)
nextID=$(( lastID + 1 ))

#handles group IDs
lastGID=$(awk -F: '{print $3}' /etc/group | grep -v 65534 | sort -n | tail -1)
nextGID=$(( lastGID + 1 )) 

if [[ $# -ne 1 ]]; then
	echo "you must use 1 argument, you used $#!"
	exit
fi

echo "The next avalible user ID is: $nextID"

add_user=$1

echo "You wanted to add user $add_user. Do you want to proceed [y/n]"
read choice

if [[ $choice == y ]]; then
	echo "Next avaible GID is: $nextGID"
	echo "Creating group and user..."

	sudo groupadd -g "$nextGID" "$add_user"
	sudo useradd -u "$nextID" -g "$nextGID" -m -s /bin/bash "$add_user"

	echo "Set the password for $add_user:"
	sudo passwd "$add_user"

	echo "User $add_user is now created!"
	cat /etc/passwd | grep "^$add_user:"
else
	echo "exiting program..."
	exit
fi


