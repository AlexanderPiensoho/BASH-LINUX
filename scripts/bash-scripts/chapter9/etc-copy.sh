#!/usr/bin/env bash 
set -u

copy_path=~/scripts/test-data/
LIST=/etc/*

for i in $LIST; do
	sudo cp -r "$i" "${copy_path}$(basename "$i").bak"
done
