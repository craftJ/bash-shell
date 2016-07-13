#!/bin/bash

# here are some calculate functions
# add by zj, 2016-7-13


# $#: nums of params
# $*: a variable contains all input params
# $@: a variable contains all input params(every param can be accessed by for)
# !#: nums of params in ${}
# $1: first param in cmdLine


#show all params
echo "-------- nums of params is $# ------------"
num=0
for a in $@
do
	echo "param[$num] is $a"
	num=$[ $num + 1 ]
done


paramnums=3
if [ $# -ne $paranums ]
then
	echo "USAGE: [option] a b"
fi

result=0
case $1
add)
	result=$[ $2 + $3 ];;
mul)
	result=$[ $2 * $3 ];;
*)
	echo "not supoort the func $1 yet!!";;
esac


echo --------- result: $result



