#!/usr/bin/env bash

FTBB(){
	sad="FUCK THE BASH BOOK"
	for i in $(seq 1 100);do
		echo "$sad"
done
}


echo "if [ -f ~/functions/useful-func.sh ]; then
    source ~/functions/useful-func.sh
    FTBB
fi" >> ~/.bashrc 


