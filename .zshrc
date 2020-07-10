# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom"
export ZPLUG_HOME="$HOME/.config/zplug"
export TERM=xterm-256color

###############################
# zsh setting
###############################

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000

###############################
# zsh plugins
###############################

alias szplug="source $ZPLUG_HOME/init.zsh"
if [ -e $ZPLUG_HOME/init.zsh ]; then
	plugins=(git zsh-syntax-highlighting zsh-autosuggestions h)
else
	alias installzplug="git clone https://github.com/zplug/zplug $ZPLUG_HOME && zpluginstall"
	function zpluginstall() {
		szplug
		zplug 'dracula/zsh', as:theme
		zplug 'zsh-users/zsh-syntax-highlighting'
		zplug 'zsh-users/zsh-autosuggestions'
		zplug 'YouDad/h'
		zplug install
		ln -sf $ZPLUG_HOME/repos/dracula/zsh/dracula.zsh-theme $ZSH_CUSTOM/
		function __plug() {
			ln -sf $ZPLUG_HOME/repos/$1/$2 $ZSH_CUSTOM/plugins/$2
		}
		__plug zsh-users zsh-syntax-highlighting
		__plug zsh-users zsh-autosuggestions
		__plug YouDad h
	}
fi

###############################
# theme
###############################
if [ -e $ZSH_CUSTOM/dracula.zsh-theme ]; then
	ZSH_THEME="dracula"
	DRACULA_DISPLAY_CONTEXT=1
else
	ZSH_THEME="risto"
fi

###############################
# is remote ?
###############################
who am i >/dev/null 2>&1
if [[ "$?" == "0" ]]; then
	who am i | grep pts
	if [[ "$?" == "0" ]]; then
		# remote
		echo "Welcome, SSH_USER, "`who am i`
	else
		# local
	fi
fi

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

###############################
# user set
###############################
umask 022

###############################
# alias command
###############################
alias gvv="git status -vv"
alias grs="git restore --staged"
alias gbmv="git branch --move"
alias gs="git status"
alias gpod="git push origin --delete"

alias ra="ranger"
alias lg="lazygit"

alias mkdir="mkdir -p "

type colorls > /dev/null
if [[ "$?" == "0" ]]; then
	alias cll="colorls -l --sd"
	alias cla="colorls -a --sd"
	alias clla="colorls -l -a --sd"
	alias cls="colorls --sd"
fi

###############################
# source
###############################

### FZF
if [ -e $HOME/.fzf ]; then
	export PATH="$PATH:$HOME/.fzf/bin"
	[[ "$-" == "*i*" ]] && source "$HOME/.fzf/shell/completion.zsh" 2>/dev/null
	source "$HOME/.fzf/shell/key-bindings.zsh"
fi

### HHISTORY
if [ -f $MY_SRC/hhistory/hhistory.sh ]; then
	source $MY_SRC/hhistory/hhistory.sh
fi

[ -e $HOME/.profile ] && source $HOME/.profile
[ -e $HOME/.tmp_profile ] && source $HOME/.tmp_profile
