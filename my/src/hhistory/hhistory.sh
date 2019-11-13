while [ -e $HOME/my/src/hhistory/main.cpp ]; do
	if [ ! -e $HOME/my/bin/hhistory ]; then
		g++ $HOME/my/src/hhistory/main.cpp -g -o $HOME/my/bin/hhistory -std=c++11
		if [[ $? != 0 ]]; then
			echo "please install g++, cannot compile cpp"
			break
		fi
	fi

	fzf-history-widget() {
		local selected num
		setopt localoptions noglobsubst noposixbuiltins pipefail 2> /dev/null
		selected=( $($HOME/my/bin/hhistory $HOME/.zsh_history |
			FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort $FZF_CTRL_R_OPTS --query=${(qqq)LBUFFER} +m" $(__fzfcmd)) )
		local ret=$?
		if [ -n "$selected" ]; then
			num=$selected[1]
			if [ -n "$num" ]; then
				zle vi-fetch-history -n $num
			fi
		fi
		zle reset-prompt
		return $ret
	}
	zle     -N   fzf-history-widget
	bindkey '^R' fzf-history-widget
	break
done
