#!/bin/bash
if [ -e ../preinstall.sh ]; then
	source ../preinstall.sh
else
	echo "success until you can see install.sh"
	exit 1
fi

git clone git@github.com:paoloantinori/hhighlighter.git $ZSH/plugins/h
check_retval "git clone git@github.com:paoloantinori/hhighlighter.git $ZSH/plugins/h"

mv $ZSH/plugins/h/h.sh $ZSH/plugins/h/h.plugin.zsh
check_retval "mv $ZSH/plugins/h/h.sh $ZSH/plugins/h/h.plugin.zsh"
