#!/bin/bash
# This script converts all file names containing upper case characters into file# names containin

for name in *; do

if [[ "$name" != *[[:upper:]]* ]]; then
continue
fi

ORIG="$name"
NEW=`echo $name | tr 'A-Z' 'a-z'`
if [[ -f $ORIG ]]; then
	echo "File $ORIG already exists with different casing"
else
	mv "$ORIG" "$NEW"
	echo "new name for $ORIG is $NEW"
fi

done
