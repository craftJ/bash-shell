#!/bin/bash

# mark linenumber of every single line after a line's last word
# add by zj, 20160905


if [ -f $1 ] && [ -r $1 ]
then
	if [ $2 -eq 1 ]
	then
		echo "---- use gawk ----"
		gawk '{printf $0 "......" FNR"\r\n"}' $1 >$1_result1
			
	else
		echo "---- use sed and paste -----"
		sed -n '=' $1 > $1_tmp1
		paste $1 $1_tmp1 > $1_result2
	fi

else
	echo "input err, $1 is not readable file!"

fi








