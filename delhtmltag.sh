#!/bin/bash

#delete tags in html file

#add by zj;, 20160819


outputfile=handled-$1


sed 's/<[^>]*>//g' $1 > $outputfile




