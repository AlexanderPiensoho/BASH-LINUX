#!/usr/bin/env bash
#
echo "Enter your age and press [ENTER]"
read age
age_gap=$(( 16 - age ))
total_drinks=$(( (age - 18)  * 100 )) 

if (( age >= 16 )); then
	echo "You are allowed to drink beer(wopwop!)"
else
	echo "You are not allowed to drink :( you are $age_gap years away from drinking"
fi

if (( age >= 18 )); then
	echo "You have drunk $total_drinks liters of beer during your lifetime"
fi 
