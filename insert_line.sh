#!/bin/bash

#在匹配行后面添加一行
#attention： 这里环境是mac下的sed，bed形式，非gnu形式
#测试使用的匹配字符串是，shutdown -P now,


inputfile=$1
outputfile=$2

if [ -f $inputfile ]
then
	echo ---- inputfile: $inputfile ----
else
	echo ---- $inputfile not find ------
	exit 0
fi

#cp $inputfile tmpfile

cat $inputfile | sed -n '{
	p; /shutdown -P now/a\
	this is add line
	}' > $outputfile

echo --- new file ------
cat $outputfile



