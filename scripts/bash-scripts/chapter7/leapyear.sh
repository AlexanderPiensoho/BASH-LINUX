#!/usr/bin/env bash
# This script will echo how many days current month have and tell you
# if its a leapyear if the month is february
#

year=$(date +%Y)
month=$(date +%m)
month_name=$(date +%B)

if [[ $month == "02" ]]; then
	if (( year % 4 == 0 && year % 100 != 0 || year % 400 == 0 )); then
		echo "Current month is $month_name and have 29 days, it is leapyear!"
	else 
		echo "Current month is $month_name and have 28 days, it is not a leapyear!"
	fi
fi

if [[ "$month" == "04" || "$month" == "06" || "$month" == "09" || "$month" == "11" ]]; then	
  echo "current month is: $month_name and has 30 days"
	else
		echo "current month is: $month_name and has 31 days"
	fi
