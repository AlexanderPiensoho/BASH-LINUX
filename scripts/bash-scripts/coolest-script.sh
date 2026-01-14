#!/bin/bash


clear
READMELINES=$(ls -1R /usr/share/doc/* | grep -c README$)
LINESNUM=$(grep -c localhost /etc/hosts)

echo "the script is now starting..."
echo
echo "This is all the users that are using bash as their standard shell"
echo
grep bash$ /etc/passwd

echo
echo "This is all the lines in /etc/group"
echo
grep daemon /etc/group
echo
echo "Printing all the lines in /etc/group  that dont contain the string daemon"
grep -v daemon /etc/group
echo
echo "Displaying localhost information from the /etc/hosts file"
echo
grep -n localhost /etc/hosts
echo "number of lines: $LINESNUM"
echo
echo "Displaying list of /usr/share/doc subdirectories containing information about shell"
ls -l /usr/share/doc | grep sh$
echo
echo "The subdirectoriy contains $READMELINES lines" 


echo
echo "The script is now done"

