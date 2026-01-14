#!/usr/bin/env bash

set -u
echo "Hello $USER!"


if [[ $# -ne 1 ]]; then
	echo "You can only use 1 argument"
	exit 1
fi

userfind=$1

if grep -q "^$userfind:" /etc/passwd; then
	awk -v user="$userfind" -F: '$1 == user {
	print "User " user " exists and has ID: " $3 ", group: " $4 " and shell: " $7
	}' /etc/passwd
else
	echo "$userfind don't exists"
fi
