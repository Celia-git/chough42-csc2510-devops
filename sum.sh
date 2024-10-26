#!/bin/bash

if [[ "$1" == *.csv ]]; then
	while read -r num1 num2; do
 		num1="${num1//,/}"
		sum=$(( num1 + num2 ))
		echo "sum of $num1 and $num2: $sum"
	done < "$1"
else
	echo "Usage: $0 file.csv"
	exit 1
fi


