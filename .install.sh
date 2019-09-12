#!/bin/bash

if [ -d ~/src ]; then
	echo -n ""
else
	mkdir ~/src
fi

wget https://npm.taobao.org/mirrors/node/v12.10.0/node-v12.10.0-linux-x64.tar.xz && \
tar -axvf node-v12.10.0-linux-x64.tar.xz                                         && \
rm node-v12.10.0-linux-x64.tar.xz												 && \
mv node-v12.10.0-linux-x64 nodejs												 && \
mv nodejs ~/src																	 && \
sudo ln -s ~/src/nodejs/bin/npm /usr/bin/										 && \
sudo ln -s ~/src/nodejs/bin/node /usr/bin/

sudo apt install cscope ctags
