#!/usr/bin/env bash
#This script will test if we're in a leap year or not.
set -u

year="$1"
if (( ("$year" % 400) == "0" )) || (( ("$year" % 4 == "0") && ("$year" % 100 != "0") )); then
	echo "This is a leap year. don't forget to charge the extra day!"
else 
	echo "This is not a leap year."
fi

