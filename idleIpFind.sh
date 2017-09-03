#!/bin/bash
# 查找指定网段的空闲ip地址,仅支持192.168.1.xxx这种，需要两个子网段的扩展查找函数即可
# by zj 20170903

IPSEG_NUMS=0
IDLE_IP=()

function help {
	echo "------ help -----"
	echo "usage: idleIpFind [ipseg]"
	echo "For example:\"idleIpFind 192.168.1.\""
	echo "-----------------"

	return
}

function checkInputVaild {
	if [ $1 -ne 1 ]
	then
		return 1
	fi
#ip地址的正则检测，在此仅做简易版本，对末尾大于255的类型暂时不作处理
	ipseg=`echo $2 | sed -n '/\([1-2][0-9]\{2\}.\)\{2\}[1-2][0-9]\{0,2\}./p'`

	#echo "------$ipseg"

	if [ -z $ipseg ]
	then
		echo "err ipseg: $2"
		return 1
	fi

	return 0	
}


function idleIpFind {
	local result=''
	local idx=0
	for (( i = 1; i < 255; i++ ))
	do
		local pingip=${1}${i}
		echo "[$pingip] testing......"
		result=`ping -c 1 -t 1 $pingip | grep "ttl"`
		if [ -z "$result" ]
		then
			#echo "-----idx is: $idx, $pingip"
			IDLE_IP[$idx]=$pingip
			idx=$[ $idx + 1 ]
		fi
	done

	return 0
}

function idleIpPrint {
local num=${#IDLE_IP[@]}
	
	echo "------- total idle ip[$num] ---------"
	for (( i = 0; i < $num; i++ ))
	do
		echo "[$i]:${IDLE_IP[$i]}"
	done
}

checkInputVaild $# $1
if [ $? -ne 0 ]
then
	help
else
	idleIpFind $1
	idleIpPrint
fi
