#!/usr/bin/env bash

print_dir="printable-files"
name="$1"

printman(){
	if [[ -z "$1" ]]; then
		echo "Usage: printman [section]  <COMMAND>"
		exit 1
	fi

mkdir -p $print_dir

	if [[ -n "$2" ]]; then
		man "$1" > $print_dir/$1-print-file
		lp $print_dir/$1-print-file
	else
		man "$1" "$2" > $print_dir/$1-print-file
		lp $print_dir/$1-print-file
	fi

}

