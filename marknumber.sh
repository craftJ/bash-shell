#!/bin/bash

# seperate number by comma
# add by zj, 20160817

count=1
number=1

read -p "input your base number for factorial: " basenumber

while [ $count -le $basenumber ]
do
	number=$[ $number * $count ]
	count=$[ $count + 1 ]
done


result=`echo $number | sed '{
	:start
	s/\([0-9]*[0-9]\)\([0-9]\{3\}\)/\1,\2/
	t start
	}'`
	

echo "orgin number[$number]"
echo "result[$result]"





