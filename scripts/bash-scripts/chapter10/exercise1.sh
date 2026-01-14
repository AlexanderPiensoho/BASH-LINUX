#!/usr/bin/env bash
THIS_SCRIPT="$0"
ARRAY=($@)

case $# in
	0)
		echo "Totalt nr of arguments are: $#"
		echo "The scripts name is $THIS_SCRIPT and there is no arguments are passed into this script so i got nothing to show you"
		exit 0
		;;

	1|2)
		echo "This scripts name is $THIS_SCRIPT"
		echo
		echo "The first argument is: ${ARRAY[0]}"
		echo "Totalt nr of arguments are: $#"
		echo "I got nothing else to show you"
		;;
	3)
		echo "This scripts name is $THIS_SCRIPT"
		echo
		echo "The first argument is: ${ARRAY[0]}"
		echo "The third argument is: ${ARRAY[2]}"
		echo "Totalt nr of arguments are: $#"
		echo "I got nothing else to show you"
		;;
	4|5|6|7|8|9)
		echo "This scripts name is $THIS_SCRIPT"
		echo
		echo "The first argument is: ${ARRAY[0]}"
		echo "The third argument is: ${ARRAY[2]}"
		echo "Totalt nr of arguments are: $#"
		if [[ $# -gt 3 ]]; then
			echo "It is more the 3 arguments, i will now use shift 3 places to the left..."
			echo
			shift 3
			ARRAY=($@)
			echo "The remaining arguments are: ${ARRAY[*]}"
			echo
			echo "Number of arguments remaining is: ${#ARRAY[*]}"
		fi
		;;
	*)
		echo "This scripts name is $THIS_SCRIPT"
		echo
		echo "The first argument is: ${ARRAY[0]}"
		echo "The third argument is: ${ARRAY[2]}"
		echo "The Tenth argument is: ${ARRAY[9]}"
		echo "Totalt nr of arguments are: $#"
		if [[ $# -gt 3 ]]; then
			echo "It is more the 3 arguments, i will now use shift 3 places to the left..."
			echo
			shift 3
			ARRAY=($@)
			echo "The remaining arguments are: ${ARRAY[*]}"
			echo
			echo "Number of arguments remaining is: ${#ARRAY[*]}"
		fi
		;;
esac

echo
echo "Im done now...PLEASE GO TOUCH SOME GRASS!!"
