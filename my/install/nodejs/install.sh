#!/bin/bash
source ../preinstall.sh

url=https://npm.taobao.org/mirrors/node/v12.10.0/node-v12.10.0-linux-x64.tar.xz

check_dir $SRC/nodejs

wget -c $url
check_retval "wget -c $url"

tar -axf node-v12.10.0-linux-x64.tar.xz
check_retval "tar -axvf node-v12.10.0-linux-x64.tar.xz"

mv node-v12.10.0-linux-x64 nodejs
check_retval "mv node-v12.10.0-linux-x64 nodejs"

mv nodejs $SRC
check_retval "mv nodejs $SRC"

sudo ln -sf $SRC/nodejs/bin/npm /usr/bin/
check_retval "sudo ln -sf $SRC/nodejs/bin/npm /usr/bin/"

sudo ln -sf $SRC/nodejs/bin/node /usr/bin/
check_retval "sudo ln -sf $SRC/nodejs/bin/node /usr/bin/"

rm node-v12.10.0-linux-x64.tar.xz
check_retval "rm node-v12.10.0-linux-x64.tar.xz"
