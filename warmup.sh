### this is just for warm-up
### add by zj, 20160709

#!/bin/bash

echo ---------- welcome back to shell!! ---------------

# blank can not be exist in value assignment
rundate=`date`
runname=`who`

teststr0=""
teststr1="aabbccdd"
teststr2="bbccddee"
teststr3="China beijing,China shanxi,China hangzhou,China shanghai"

testnum1=10
testnum2=30
testnum3=50
testnum4=100


echo "date: $rundate"
echo "who : $runname"


# condition is a cmd
if ls -la
then
	echo "cmd ls -la exe OK"
elif sdfg
then
	echo "sdfg is exe failed"
fi

# condition is num compare
if [ $testnum1 -ne $testnum2 ]
then
	echo "$testnum1 != $testnum2"
elif [ $testnum1 -eq 10 ]
then
	echo "$testnum1 == 10"
elif [ $testnum1 -lt $testnum3 ]
then
	echo "$testnum1 <= $testnum3"
else 
	echo "testnum1 is $testnum1"
fi


# condition is string compare
if [ $teststr1 != $teststr2 ]
then
	echo "$teststr1 != $teststr2"
fi

if [ $teststr1 \> $teststr2 ]
then
	echo "$teststr1 > $teststr2"
else
	echo "$teststr1 < $teststr2"
fi

if [ -z "$teststr0" ]
then
	echo "empty str"
fi

if [ -n "$teststr1" ]
then
	echo "no empty, $teststr1"
fi

# change IFS
IFS_OLD=$IFS
IFS=$','
for a in $teststr3
do
echo "$a"
done
IFS=$IFS_OLD

for ((a=0; a<10; a++))
do
echo "next num is $a"
done


# while [command], do loop when command is exit with 0
while [ $testnum1 -ne 20 ]
do
	echo "this loop, num is $testnum1"
	testnum1=$[ $testnum1 + 1 ]
done

# until [command], do loop when command is not exit whith 0
until [ $testnum1 -le 10 ]
do
	echo "this loop, num is $testnum1"
	testnum1=$[ $testnum1 - 1 ]
done


gamename="lily"
case $gamename in
lily)
	echo "vip, please enjoy you visit!";;
dora)
	echo "hello, dora";;	
tucan)
	echo "hello, tucan";;	
*)
	echo "hello, guest";;
esac

