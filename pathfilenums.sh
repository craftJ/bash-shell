#!/bin/bash
# show file nums of each dir in $PATH
# add by zj, 20160719


mypath=`echo $PATH | sed 's/:/ /g'`
count=0


for dir in $mypath
do
	subdir=`ls $dir`
	for subfile in $subdir
	do
		count=$[ $count + 1 ]
	done
	echo "$dir -- $count"
	count=0
done


