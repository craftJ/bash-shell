#！/bin/bash

# use sed to reverse file lines
# add by zj,20160817


inputfile=$1

#cat $inputfile


# $2 -ne 0: reverse
if [ $2 -eq 0 ]
then
sed -n '{h ; G ; $p}' $inputfile
else
sed -n '{1!G; h; $p}' $inputfile
fi








