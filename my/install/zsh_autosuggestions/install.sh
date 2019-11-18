#!/bin/bash
if [ -e ../preinstall.sh ]; then
	source ../preinstall.sh
else
	echo "success until you can see install.sh"
	exit 1
fi

if [ ! -e $ZSH/plugins/zsh-autosuggestions ]; then
	git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH/plugins/zsh-autosuggestions
	check_retval "git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH/plugins/zsh-autosuggestions"
fi
