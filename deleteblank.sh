#!/bin/bash

#delete blank rows with different kinds style
#add by zj, 20160818


showhelp() {
	
	echo "USAGE:[option][filename]"
	echo "option:"
	echo "1: delete head blank rows"
	echo "2: delete middle blank rows"
	echo "3: delete last blank rows"
}


checkoption() {
	
	local optionvaild=1

	if [ $inputnums -ne 2 ]
	then
		optionvaild=1
	elif [ $1 -ne 1 ] && [ $1 -ne 2 ] && [ $1 -ne 3 ]
	then
		optionvaild=1
	else
		optionvaild=0
	fi

	echo "$optionvaild"
}


inputnums=$#
output=result-$2


checkresult=`checkoption $1`


echo "[$checkresult]"

if [ $checkresult -ne 0 ]
then
	showhelp
	exit
fi

case $1 in
1)
	sed '/./,$!d' $2 > $output;;
2)
	sed '/./,/^$/!d' $2 > $output;;
3)
	sed '{:start /^\n*$/{$d; N; b start}}' $2 > $output;;
*)
	echo "err option";;
esac

	

