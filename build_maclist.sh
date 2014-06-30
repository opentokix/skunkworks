#!/usr/bin/env bash

if [ ! -n  "$1" ]
then 
	printf "Usage: script.sh filename.ext\n"
	exit 1
fi


while read line 
do
	printf "$line,"
	MACS=$(ssh -n root@$line 'ifconfig|grep HWaddr|tr -s " "|cut -d " " -f 5|sort|uniq|tr "\n" " "')
	printf "$MACS\n"

done < $1
