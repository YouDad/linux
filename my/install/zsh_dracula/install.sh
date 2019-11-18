#!/bin/bash
if [ -e ../preinstall.sh ]; then
	source ../preinstall.sh
else
	echo "success until you can see install.sh"
	exit 1
fi

if [ ! -e $SRC/zsh_dracula ]; then
	_=https://github.com/dracula/zsh.git $SRC/zsh_dracula
	git clone $_
	check_retval "git clone $_"
fi

ln -sf $SRC/zsh_dracula/dracula.zsh-theme $ZSH/themes/dracula.zsh-theme
check_retval "ln -sf $SRC/zsh_dracula/dracula.zsh-theme $ZSH/themes/dracula.zsh-theme"
