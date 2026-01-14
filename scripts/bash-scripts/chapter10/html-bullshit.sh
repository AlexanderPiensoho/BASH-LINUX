#!/usr/bin/env bash

URL_HISTORY=()
HTML_FILE="website.html"

while true; do

cat << CHOICE
1. PASTE URL
B[BACK]
Q[QUIT]
CHOICE

read choice 
case "$choice" in

	b|B)
		if [[ ${#URL_HISTORY[@]} -gt 0 ]]; then 
			echo "Going back to the previous URL..."
			wget -qO ${URL_HISTORY[-1]}
			links -dump ${URL_HISTORY[-1]} 
		fi
		
			"No prevoius URL snippets"
		;;

	q|Q)
		echo "URL history: ${#URL_HISTORY[@]}"
		echo "Exiting program..."
		exit 0
		;;

	1)
		echo "Enter your URL: "
		read input
		if [[ ${#URL_HISTORY[*]} -ge 10 ]]; then
			URL_HISTORY=("${#URL_HISTORY[@:1]}")
		fi

		
		wget -qO "$HTML_FILE" "$input"
		echo "--------------------------------WEBSITE STARTS HERE-------------------------------------------"
		echo
		links -dump "$HTML_FILE"	
		echo
		echo "--------------------------------WEBSITE STOPS HERE--------------------------------------------"
		URL_HISTORY+=("$input")
		continue
		;;
	*)
		echo "Invalid input"
		exit 2
		;;
esac
done

