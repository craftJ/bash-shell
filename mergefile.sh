#!/bin/bash

# merge some files into one
# add by zj,20160825

#DATE_INFO=`date +%s`
MERGE_RESULT="mergeresult"
MERGE_RESULT_TMP=$MERGE_RESULT"_tmp"
FILE_TMP=""
MERGE_LIST=""

echo "------ init result file -------"
echo "org file:"
head -n 10 $MERGE_RESULT
echo "" > $MERGE_RESULT
echo "init complete:"
cat $MERGE_RESULT
echo "--------------------------------"




echo "------ clear blankline --------"
for filename in $@
do
	FILE_TMP=$filename"_tmp"
	touch $FILE_TMP
	echo "" > $FILE_TMP
	sed -n '/^$/!p' $filename | sed -n "1,\$w $FILE_TMP"
	echo "$filename"
	cat $FILE_TMP
	MERGE_LIST="$MERGE_LIST $FILE_TMP"
done
echo "-------------------------------"


echo "------- merge ------------------"
echo "merge list: $MERGE_LIST"

paste $MERGE_LIST > $MERGE_RESULT_TMP

#add line number for result file
sed '=' $MERGE_RESULT_TMP | sed '{N; s/\n/ /}' > $MERGE_RESULT



