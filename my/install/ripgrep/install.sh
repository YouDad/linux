#!/bin/bash
if [ -e ../preinstall.sh ]; then
	source ../preinstall.sh
else
	echo "success until you can see install.sh"
	exit 1
fi

case $OS in
	ManjaroLinux)
		sudo pacman -S ripgrep
		check_retval "sudo pacman -S ripgrep"
		;;
	Ubuntu)
		curl https://sh.rustup.rs -sSf | sh
		check_retval "curl https://sh.rustup.rs -sSf | sh"

		source $HOME/.cargo/env
		git clone https://github.com/BurntSushi/ripgrep $MY_SRC
		check_retval "git clone https://github.com/BurntSushi/ripgrep $MY_SRC"

		cd $MY_SRC/ripgrep
		check_retval "cd $MY_SRC/ripgrep"

		cargo build --release
		check_retval "cargo build --release"
		;;
	*)echo $OS, unknown
		;;
esac


