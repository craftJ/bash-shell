#!/bin/bash
# script for git add, commit and push
# add by zj, 20160719

# ./gitcm [filename] [remote repositry] [commitinfo]


if [ $# -ne 3 ]
then
echo "USAGE: [filename] [remote repositry] [commitinfo]"
exit 0
fi

filename=$1
remoterepos=$2
commitinfo=$3

echo "[file]   : $filename"
echo "[remote] : $remoterepos"
echo "[info]   : $commitinfo"


echo "====== git add ======"
git add $filename

echo "====== git commit ====="
git commit -m "$commitinfo"

echo "====== git push ======"
git push $remoterepos master




