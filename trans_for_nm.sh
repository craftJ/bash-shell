#!/bin/bash



inputfile=$1
tmpfile=tmp
outputfile=out.txt

#筛选出全局变量
cat $inputfile | grep '|   S  |' > tmp

echo ------- global ---------
cat tmp


#遍历每一行，将size先转换成10进制
cat tmp | while read line
do	
	name=`echo $line | awk '{print $1}'`
	size=`echo $line | awk '{print $5}'`
	echo $size
	resultsize=`echo 'obase=10;ibase=16;' $size | bc`
	echo $resultsize
	echo "$name     $resultsize" >> $outputfile
done

echo --------- result --------
cat $outputfile
#对结果进行筛选，输出指定的列







