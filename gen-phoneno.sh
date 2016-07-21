#!/bin/bash
# radom generate some phonenumber,and also mix some invaild number in file
# add by zj, 20160721


numbers=$1
len1=6
len2=13
lenvaild=11
numlen=0
outputfile=phone-`date +%s`.txt

cmcc=(134 135 136 137 138 139 150 151 152 157 158 159)
ct=(133 153 181 189)
cunt=(130 131 132 155 156 186)
phonehead=(${cmcc[*]} ${ct[*]} ${cunt[*]})
headnums=${#phonehead[@]}



random_number(){
	
	local min=$1
	local max=$2
	local diffnum=$[ $2 - $1 + 1 ]
	local ran=$[ $RANDOM%$diffnum + $min ]
	echo $ran
}


gen-vaild-phone(){
	local i=0
	local rantype=`random_number 1 $headnums`
	local leftlen=$[ $lenvaild - ${#phonehead[0]} ]

	echo -n ${phonehead[$[ $rantype - 1]]} >> $outputfile

	for ((i = 0; i < $leftlen; i++))
	do
		echo -n `random_number 1 9` >> $outputfile
	done

	echo "" >> $outputfile
}


gen-invaild-phone(){
	local i=0
	for ((i = 0; i < $numlen; i++)) 
	do
		echo -n `random_number 1 9` >> $outputfile 
	done
	echo "" >> $outputfile
}


for (( i = 0; i < $numbers; i++))
do
	numlen=`random_number $len1 $len2`

	if [ $numlen -eq $lenvaild ]
	then
		gen-vaild-phone
	else
		gen-invaild-phone
	fi
done




