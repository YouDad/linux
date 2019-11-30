#!/bin/bash
if [ -e ../preinstall.sh ]; then
	source ../preinstall.sh
else
	echo "success until you can see install.sh"
	exit 1
fi

wget --continue https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
tar axf phantomjs-2.1.1-linux-x86_64.tar.bz2
rm -rf phantomjs-2.1.1-linux-x86_64.tar.bz2
mv phantomjs-2.1.1-linux-x86_64/bin/phantomjs $HOME/my/bin
rm -rf phantomjs-2.1.1-linux-x86_64
