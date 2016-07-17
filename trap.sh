#!/bin/bash
# practice for trap
# add by zj 20160717


trap "echo exit signal happen!!!" exit

#Ctrl+c: SIGINT,  Ctrl+z:SIGTSTP
trap "echo interrupt signal happen!!!" SIGINT SIGTERM SIGTSTP



for ((a=0; a<10; a++))
do
	echo "Loop is #$a"
	sleep 1
done

trap - EXIT
trap - SIGINT
trap - SIGTSTP
trap - SIGTERM

echo "signal trap removed~~"






