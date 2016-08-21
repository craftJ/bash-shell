#!/bin/bash

# backup some files by your cfg
# add by zj,20160821

DATE_YEAR=`date +%Y`
DATE_MONTH=`date +%m`
DATE_DAY=`date +%d`
DATE_TIME=`date +%H%M%S`
FILE_CFG="/home/tiger/mybackup/CFG_FILES_BACKUP"
PACK_STOR_BASE="/home/mybackup"
PACK_FILE_NAME=$PACK_STOR_BASE/$DATE_YEAR/$DATE_MONTH/$DATE_DAY/backup-$DATE_TIME.tar.gz


echo configure file:$FILE_CFG
echo backup filename:$PACK_FILE_NAME


if [ -f $FILE_CFG -o -r $FILE_CFG ]
then
	echo "------- cfg file is ok ----------"
else
	echo "------- cfg file is not exist --------"
	exit
fi


exec 0>$FILE_CFG

# step1: read your cfg file
# step2: check file for backup
# step3: tar and backup, generate backup file by date

read filename

fileno=0
addno=0
while [ $? -eq 0 ]
do
	fileno=$[ $fileno + 1 ]
	if [ -f $filename -o -d $filename ]
	then
		echo "add backup file :$filename"
		filelist="$filelist $filename"
		addno=$[ $addno + 1 ]
	else
		echo "can not file:NO.[$fileno],Name:[$filename]"
	fi

	read filename	
done
	

if [ $addno -le 0 ]
then
	echo "no files for backup, addnums:$addno"
	exit
fi


mkdir -p $PACK_SOTR_BASE/$DATE_YEAR/$DATE_MONTH/$DATE_DAY

tar -zcf $PATH_FILE_NAME $filelist 2> /dev/null




