#!/bin/bash
if [ -e ../preinstall.sh ]; then
	source ../preinstall.sh
else
	echo "success until you can see install.sh"
	exit 1
fi

url=https://npm.taobao.org/mirrors/node/v12.10.0/node-v12.10.0-linux-x64.tar.xz

check_dir $MY_SRC/nodejs

wget -c $url
check_retval "wget -c $url"

tar -axf node-v12.10.0-linux-x64.tar.xz
check_retval "tar -axvf node-v12.10.0-linux-x64.tar.xz"

mv node-v12.10.0-linux-x64 nodejs
check_retval "mv node-v12.10.0-linux-x64 nodejs"

mv nodejs $MY_SRC
check_retval "mv nodejs $MY_SRC"

sudo ln -sf $MY_SRC/nodejs/bin/npm /usr/bin/
check_retval "sudo ln -sf $MY_SRC/nodejs/bin/npm /usr/bin/"

sudo ln -sf $MY_SRC/nodejs/bin/node /usr/bin/
check_retval "sudo ln -sf $MY_SRC/nodejs/bin/node /usr/bin/"

rm node-v12.10.0-linux-x64.tar.xz
check_retval "rm node-v12.10.0-linux-x64.tar.xz"
