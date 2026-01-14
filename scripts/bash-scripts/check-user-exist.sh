#!/bin/bash
#Checks if a user exists, change USER_LOOKUP varible to search for another user.
clear
USER_LOOKUP="alexander"
echo "The script is now starting"

echo "I will now check if user $USER_LOOKUP exists"
echo
grep ^$USER_LOOKUP: /etc/passwd
echo
echo "the user $USER_LOOKUP exists"

