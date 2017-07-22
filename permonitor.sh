#!/bin/bash

# monitor of performance
# by zj 20170720
# mac 上获取性能工具
# 0. 当前设备的内核版本，硬件信息等基本情况；
# 1. cpu开销，列出一定时间内开销前10的进程，
# 2. 内存开销，列出占用内存最多的前10的进程
# 3. io状态，各磁盘的读写速度
# 4. 网络负载，当前总的带宽，当前的网速，当前占用带宽前10的进程
# 5. 硬盘空间，当前各个用户的存储空间占用情况；

function help() {
	echo '------- performance tool --------'
	echo '
		[0] show sys info;
		[1] show cpu cost;
		[2] show mem cost;
		[3] show io stastus;
		[4] show net status;
		[5] show storage status;
		'
	echo '---------------------------------'		
}


function showsysinfo() {
	#local cpuinfo=`sysctl -a | grep 'machdep.cpu.'`
	sysctl -a | grep 'machdep.cpu'
}

function cpucost() {
	echo '---todo'
}

function memcost() {
	echo '---todo'
}

function inoutcost() {
	echo '---todo'
}

function netstatus(){
	echo '---todo'
}

function storstatus(){
	echo '---todo'
}


help
read -p "input your choice[0-5]: " choice
case $choice in
	0)
		showsysinfo;;	
	1)
		cpucost;;
	2)
		memcost;;
	3)
		inoutcost;;
	4)
		netstatus;;
	5)
		storstatus;;
	*)
		echo 'unsupport !!!! choice:'$choice
		#help;;
esac


