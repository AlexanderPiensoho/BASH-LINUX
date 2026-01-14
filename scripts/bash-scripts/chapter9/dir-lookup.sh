#!/usr/bin/env bash
set -u

dir="$1"

if [[ $# -ne "1" ]]; then
	echo "You can only use 1 argument!"
	exit 1
fi

biggest_files=$(find $dir -type f -printf "%s_%p\n" | sort -rn | head -n 5)
last_modified=$(find $dir -type f -printf "%TF_%TH:%TM:%S_%p\n" | sort -rn | head -n 5)

if [[ -d $dir ]]; then

	echo -e "The 5 biggest files in $dir are:\n$biggest_files"
	echo
	echo -e  "The 5 last modified files in $dir are:\n$last_modified"

else
	echo "This is not a directory!"
	exit 1
fi

