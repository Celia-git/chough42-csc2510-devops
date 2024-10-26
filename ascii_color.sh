#!/bin/bash

colorcode=37
shape=diamond

make_square(){
	symbol="@"
	for (( i=0; i<=11; i++ )); do
		echo -ne "\e[${colorcode}m$symbol\e[0m"
	done
	echo
	for (( i=0; i<10; i++ )); do
		printf "\e[${colorcode}m%s%$(( 10 ))s%s\e[0m\n" "$symbol" "" "$symbol"	
	done

	for (( i=0; i<=11; i++ )); do
		echo -ne "\e[${colorcode}m$symbol\e[0m"
	done
}


make_diamond(){
	symbol="%"
	for (( i=0; i<10; i++ )); do
		space=$(( 10 - i ))
		printf "%${space}s" ""
		echo -ne "\e[${colorcode}m$symbol\e[0m"
		printf "%$(( 2 * i ))s" ""
		echo -ne "\e[${colorcode}m$symbol\e[0m"
		printf "%${space}s" ""
		echo
	done

	for (( i=0; i<=10; i++ )); do
		space=$(( 10 - i ))
		printf "%${i}s" ""
		echo -ne "\e[${colorcode}m$symbol\e[0m"
		printf "%$(( 2 * space ))s" ""
		echo -ne "\e[${colorcode}m$symbol\e[0m"
		echo
	done

}

make_triangle(){
	symbol="&"
	for (( i=0; i<10; i++ )); do
    		printf "%$(( 10 - i ))s" ""  
    		echo -ne "\e[${colorcode}m$symbol\e[0m"  
    		printf "%$(( 2 * i ))s" ""  
    		echo -ne "\e[${colorcode}m$symbol\e[0m"  
    		printf "%$(( 10 - i ))s" ""  
    		echo  
	done
	
	for (( i=0; i<=10; i++ )); do
		echo -ne "\e[${colorcode}m$symbol \e[0m"
	done


}


make_line(){
	symbol="/"
	for (( i=0; i<20; i++ )); do
		printf "%$(( 20 -i ))s" ""
		echo -ne "\e[${colorcode}m$symbol\e[0m"
		printf "%$(( i ))s" ""
		echo
	done
}


if [ "$#" -ne 2 ]; then
	echo "Usage: $0 {black|red|green|yellow|blue|magenta|cyan|white} {line|square|diamond|triangle}"
	exit
fi

case $1 in
	black)
		colorcode=30
		;;
	red)
		colorcode=31
		;;
	green)
		colorcode=32
		;;
	yellow)
		colorcode=33
		;;
	blue)
        	colorcode=34
        	;;
    	magenta)
        	colorcode=35
        	;;
    	cyan)
        	colorcode=36
        	;;
   	white)
        	colorcode=37
        	;;
	*)
		echo "Invalid color: $1"
		echo "Usage: $0 {black|red|green|yellow|blue|magenta|cyan|white} {line|square|diamond|triangle}"
        	exit 1
        	;;
esac

case $2 in
	line)
		make_line
		;;
	square)
		make_square
		;;
	diamond)
		make_diamond
		;;
	triangle)
		make_triangle
		;;
	*)
		echo "Invalid shape: $2"
		echo "Usage: $0 {black|red|green|yellow|blue|magenta|cyan|white} {line|square|diamond|triangle}"
esac
