#!/usr/bin/env bash
# This script will echo how many days current month have and tell you
# if its a leapyear if the month is february
#

year=$(date +%Y)
month=$(date +%m)
month_name=$(date +%B)

case "$month" in
	02)
	if (( year % 4 == 0 && year % 100 != 0 || year % 400 == 0 )); then
		echo "Current month is $month_name and have 29 days, its a leapyear!"
	else
		echo "Current month is $month_name and have 28 days, its not a leapyear!"
	fi 
	;;


	04|06|09|11)
		echo "Current month is $month_name and have 30 days!"
	;; 


	*)
		echo "Current month is $month_name and has 31 days!"
	;;

esac
