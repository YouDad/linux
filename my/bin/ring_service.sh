#!/bin/bash

while true; do
	if [ -e ~/my/link/ring ]; then
		content=`cat ~/my/link/ring`
		sudo rm ~/my/link/ring

		if [[ "$content" == "" ]]; then
			ring
		else
			speak "$content"
		fi
	fi
	sleep 5
done
