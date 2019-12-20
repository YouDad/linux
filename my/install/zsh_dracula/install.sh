#!/bin/bash
if [ -e ../preinstall.sh ]; then
	source ../preinstall.sh
else
	echo "success until you can see install.sh"
	exit 1
fi

if [ ! -e $MY_SRC/zsh_dracula ]; then
	url=https://github.com/dracula/zsh.git
	git clone $url $MY_SRC/zsh_dracula
	check_retval "git clone $url $MY_SRC/zsh_dracula"
fi

ln -sf $MY_SRC/zsh_dracula/dracula.zsh-theme $ZSH_CUSTOM/dracula.zsh-theme
check_retval "ln -sf $MY_SRC/zsh_dracula/dracula.zsh-theme $ZSH_CUSTOM/dracula.zsh-theme"
