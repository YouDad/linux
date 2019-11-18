#!/bin/bash
source ../preinstall.sh

case $OS in
	ManjaroLinux)
		sudo pacman -S ripgrep
		check_retval "sudo pacman -S ripgrep"
		;;
	Ubuntu)
		curl https://sh.rustup.rs -sSf | sh
		check_retval "curl https://sh.rustup.rs -sSf | sh"

		source $HOME/.cargo/env
		git clone https://github.com/BurntSushi/ripgrep ~/my/src/
		check_retval "git clone https://github.com/BurntSushi/ripgrep ~/my/src/"

		cd ~/my/src/ripgrep
		check_retval "cd ~/my/src/ripgrep"

		cargo build --release
		check_retval "cargo build --release"
		;;
	*)echo $OS, unknown
		;;
esac


