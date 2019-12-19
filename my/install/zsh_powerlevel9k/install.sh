#!/bin/bash
if [ -e ../preinstall.sh ]; then
	source ../preinstall.sh
else
	echo "success until you can see install.sh"
	exit 1
fi

if [ ! -e $MY_SRC/powerlevel9k ]; then
	_=https://github.com/bhilburn/powerlevel9k.git $MY_SRC/powerlevel9k
	git clone $_
	check_retval "git clone $_"
fi

_=https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/DroidSansMono.zip
wget -c $_ /tmp/DroidSansMono.zip
check_retval "wget -c $_"

cp /tmp/DroidSansMono.zip ./
check_retval "cp /tmp/DroidSansMono.zip ./"

unzip DroidSansMono.zip
check_retval "unzip DroidSansMono.zip"

rm DroidSansMono.zip
check_retval "rm DroidSansMono.zip"

if [ ! -e $HOME/.fonts ]; then
	mkdir $HOME/.fonts
	check_retval "mkdir $HOME/.fonts"
fi

sudo mv Droid* $HOME/.fonts
check_retval "sudo mv Droid* $HOME/.fonts"

fc-cache --help
if [[ "$?" != "0" ]]; then
	if [[ "$OS" == "Ubuntu" ]]; then
		sudo apt-get install fontconfig
		check_retval "sudo apt-get install fontconfig"
	fi
fi

sudo fc-cache -fv $HOME/.fonts
check_retval "sudo fc-cache -fv $HOME/.fonts"
