#!/bin/bash

expect <<EOF
	set timeout 3600
	spawn $*
	expect {
		"Username" {
			send "xxxuser\r";
			exp_continue;
		}
		"Password" {
			send "xxxpass\r";
		}
	}
	expect eof
EOF
