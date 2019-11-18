#!/bin/bash
if [ -e ../preinstall.sh ]; then
	source ../preinstall.sh
else
	echo "success until you can see install.sh"
	exit 1
fi

case $OS in
	ManjaroLinux)
		sudo pacman -Sy neovim
		check_retval "sudo pacman -Sy neovim"

		sudo ln -sf nvim /usr/bin/vim
		check_retval "sudo ln -sf nvim /usr/bin/vim"

		sudo ln -sf nvim /usr/bin/vi
		check_retval "sudo ln -sf nvim /usr/bin/vi"

		sudo ln -sf nvim /usr/bin/nano
		check_retval "sudo ln -sf nvim /usr/bin/nano"
		;;
	Ubuntu)
		sudo add-apt-repository -yu ppa:neovim-ppa/unstable
		check_retval "sudo add-apt-repository -yu ppa:neovim-ppa/unstable"

		sudo aptitude install neovim
		check_retval "sudo aptitude install neovim"

		sudo ln -sf nvim /usr/bin/vim
		check_retval "sudo ln -sf nvim /usr/bin/vim"

		sudo ln -sf nvim /usr/bin/vi
		check_retval "sudo ln -sf nvim /usr/bin/vi"

		sudo ln -sf nvim /usr/bin/nano
		check_retval "sudo ln -sf nvim /usr/bin/nano"
		;;
	*)echo $OS, unknown
		;;
esac
