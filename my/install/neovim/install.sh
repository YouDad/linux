case $OS in
	ManjaroLinux)
		sudo pacman -Sy neovim
		sudo ln -sf nvim /usr/bin/vim
		sudo ln -sf nvim /usr/bin/vi
		sudo ln -sf nvim /usr/bin/nano
		;;
	Ubuntu)
		sudo add-apt-repository -yu ppa:neovim-ppa/unstable
		sudo aptitude install neovim
		sudo ln -sf nvim /usr/bin/vim
		sudo ln -sf nvim /usr/bin/vi
		sudo ln -sf nvim /usr/bin/nano
		;;
	*)echo $OS, unknown
		;;
esac
