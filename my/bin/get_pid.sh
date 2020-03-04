#!/bin/bash

res=`ps a|grep "$1"|grep -v "grep"|grep -v "get_pid"`
if [[ "${#res}" == "0" ]]; then
	exit 1
fi
echo "$res"|head -1|cut -d " " -f 1
