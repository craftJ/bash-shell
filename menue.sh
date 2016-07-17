#!/bin/bash
#simple menue
#add by zj 20170718


menue(){
	clear
	echo -e "\t\tsysinfo"
	echo -e "\t1: Display Date"
	echo -e "\t2: Display UserInfo"
	echo -e "\t3: Display DiskInfo"
	echo -e "\t4: Display MemInfo"
	echo -e "\t5: Display CPU Info"
	echo -e "\t6: Display OS version"
	echo -e "\t0: exit program"
	read -n 1 option
}


display_date(){
	clear
	date
}

display_usr(){
	clear
	who
}


display_disk(){
	clear
	df -k
}

display_mem(){
	clear
	cat /proc/meminfo
}

display_cpu(){
	clear
	cat /proc/cpuinfo
}

display_version(){
	clear
	cat /proc/version
}

while [ 1 ]
do
	menue
	case $option in
	1)
		display_date;;
	2)
		display_usr;;
	3)
		display_disk;;
	4)
		display_mem;;
	5)
		display_cpu;;
	6)
		display_version;;
	0)
		break;; ##this is different from c, break here will exit the while 
	*)
		echo "ERR, unknown option";;
	esac
	echo "enter any key to continue"
	read -n 1 line
done



