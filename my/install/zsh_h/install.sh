#!/bin/bash
if [ -e ../preinstall.sh ]; then
	source ../preinstall.sh
else
	echo "success until you can see install.sh"
	exit 1
fi

git clone git@github.com:paoloantinori/hhighlighter.git $ZSH_CUSTOM/plugins/h
check_retval "git clone git@github.com:paoloantinori/hhighlighter.git $ZSH_CUSTOM/plugins/h"

mv $ZSH_CUSTOM/plugins/h/h.sh $ZSH_CUSTOM/plugins/h/h.plugin.zsh
check_retval "mv $ZSH_CUSTOM/plugins/h/h.sh $ZSH_CUSTOM/plugins/h/h.plugin.zsh"
