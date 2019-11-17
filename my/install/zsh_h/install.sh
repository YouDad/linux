#!/bin/bash
source ../preinstall.sh

git clone git@github.com:paoloantinori/hhighlighter.git $ZSH/plugins/h
check_retval "git clone git@github.com:paoloantinori/hhighlighter.git $ZSH/plugins/h"

mv $ZSH/plugins/h/h.sh $ZSH/plugins/h/h.plugin.zsh
check_retval "mv $ZSH/plugins/h/h.sh $ZSH/plugins/h/h.plugin.zsh"
