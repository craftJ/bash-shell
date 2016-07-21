#!/bin/bash
# check usr passwd and shutdown the device
# add by zj 20160715

read -t 5 -p "zhimakaimen:" passwd

if [ $? -ne 0 ]
then
	echo "time out"
	exit 0
fi


if [ $passwd = "oo" ]
then
	read -p "delay time(s): " delaytime
else
	echo "too yong too simle"
	exit 0
fi



if [ $delaytime -gt 0 ]
then
	for ((a=$delaytime; a>0; a--))
	do
		echo "device is shuting down....($a)"
		sleep 1
	done
	echo "----------- shut down !-----------"
	sudo shutdown -P now
fi




