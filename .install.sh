#!/bin/bash

function check_retval() {
	if [[ $? != 0 ]]; then
		echo $1
		exit $?
	fi
}

function need_dir() {
	dir_name=$1
	if [ ! -d $dir_name ]; then
		mkdir $dir_name
		check_retval "need dir: $dir_name"
	fi
}

function check_dir() {
	dir_name=$1
	if [ -d $dir_name ]; then
		echo "already exist dir: $dir_name"
		exit 1
	fi
}

function install_nodejs() {
	need_dir ~/src
	check_dir ~/src/nodejs
	url=https://npm.taobao.org/mirrors/node/v12.10.0/node-v12.10.0-linux-x64.tar.xz

	wget $url
	check_retval "wget [$url] failed"

	tar -axvf node-v12.10.0-linux-x64.tar.xz
	check_retval "tar -axvf node-v12.10.0-linux-x64.tar.xz"

	mv node-v12.10.0-linux-x64 nodejs
	check_retval "mv node-v12.10.0-linux-x64 nodejs"

	mv nodejs ~/src
	check_retval "mv nodejs ~/src"

	sudo ln -s ~/src/nodejs/bin/npm /usr/bin/
	check_retval "sudo ln -s ~/src/nodejs/bin/npm /usr/bin/"

	sudo ln -s ~/src/nodejs/bin/node /usr/bin/
	check_retval "sudo ln -s ~/src/nodejs/bin/node /usr/bin/"

	rm node-v12.10.0-linux-x64.tar.xz
	check_retval "rm node-v12.10.0-linux-x64.tar.xz"
}

function install_aptitude() {
	sudo apt install aptitude
	check_retval "sudo apt install aptitude"

	sudo aptitude install cscope ctags
	check_retval "sudo aptitude install cscope ctags"
}

eval $1_$2
