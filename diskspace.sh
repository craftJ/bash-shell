#!/bin/bash

# show top20 space usage of dir selected by usr
# add by zj, 20160820


DATE=`date +%y%m%d%H%M%S`

echo "$DATE"

if [ 1 -eq 1 ]
then

#exec 1>diskuse-$DATE
 
for dir in $@
do
	echo ""
	echo "---------- [$dir] ------------"
	du -Sh $dir 2>/dev/null | 
   	sort -rh |
	sed '{21,$D; =}' |
	sed 'N; s/\n/ /' |
	gawk '{print "[" $1 "]" "\t" $2 "\t" $3}'	

done

fi



