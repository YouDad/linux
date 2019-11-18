# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

###############################
# zsh setting
###############################

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000

###############################
# theme
###############################
if false && [ -e $HOME/my/src/powerlevel9k/powerlevel9k.zsh-theme ]; then
	if [ ! -e $HOME/.oh-my-zsh/themes/powerlevel9k.zsh-theme ]; then
		ln -sf $HOME/my/src/powerlevel9k/powerlevel9k.zsh-theme $HOME/.oh-my-zsh/themes/
	fi
	ZSH_THEME="powerlevel9k"
	POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir background_jobs newline status)
	POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
#	POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs status newline os_icon)
#	POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(root_indicator background_jobs time history)
	POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
#	POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
	
	POWERLEVEL9K_SHORTEN_DIR_LENGTH=8
	POWERLEVEL9K_SHORTEN_STRATEGY=truncate_from_right
	POWERLEVEL9K_MODE='nerdfont-complete'
	POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="↱"
	POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="↳ "
elif [ -e $HOME/.oh-my-zsh/themes/dracula.zsh-theme ]; then
	ZSH_THEME="dracula"
else
	ZSH_THEME="robbyrussell"
fi

###############################
# is remote ?
###############################
remote=`who am i | wc | sed "s/ //g"`

if [[ $remote != "000" && $ZSH_THEME == "powerlevel9k" ]]; then
	if [ -e $HOME/.oh-my-zsh/themes/dracula.zsh-theme ]; then
		ZSH_THEME="dracula"
	else
		ZSH_THEME="robbyrussell"
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

### PLUGINS
plugins=(git zsh-syntax-highlighting)
if [[ "$TMUX" == "" ]]; then
	plugins+=(zsh-autosuggestions)
else
fi

if [ -e "$ZSH/plugins/h" ]; then
	plugins+=(h)
fi

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

if [ -e /mnt/win10.c ]; then
	mountpoint /mnt/win10.c 1>/dev/null 2>&1
	if [[ "$?" == "1" ]]; then
		sudo mount /dev/sda4 /mnt/win10.c 1>/dev/null 2>&1
	fi
fi
if [ -e /mnt/win10.g ]; then
	mountpoint /mnt/win10.g 1>/dev/null 2>&1
	if [[ "$?" == "1" ]]; then
		sudo mount /dev/sda5 /mnt/win10.g 1>/dev/null 2>&1
	fi
fi
if [ -e /mnt/win10.d ]; then
	mountpoint /mnt/win10.d 1>/dev/null 2>&1
	if [[ "$?" == "1" ]]; then
		sudo mount /dev/sdb1 /mnt/win10.d 1>/dev/null 2>&1
	fi
fi
if [ -e /mnt/win10.e ]; then
	mountpoint /mnt/win10.e 1>/dev/null 2>&1
	if [[ "$?" == "1" ]]; then
		sudo mount /dev/sdb2 /mnt/win10.e 1>/dev/null 2>&1
	fi
fi
if [ -e /mnt/win10.f ]; then
	mountpoint /mnt/win10.f 1>/dev/null 2>&1
	if [[ "$?" == "1" ]]; then
		sudo mount /dev/sdb3 /mnt/win10.f 1>/dev/null 2>&1
	fi
fi
if [ -e /mnt/other.ubuntu1604 ]; then
	mountpoint /mnt/other.ubuntu1604 1>/dev/null 2>&1
	if [[ "$?" == "1" ]]; then
		sudo mount /dev/sda2 /mnt/other.ubuntu1604 1>/dev/null 2>&1
	fi
fi

###############################
# user set
###############################
umask 022

###############################
# alias command
###############################
alias gvv="git status -vv"
alias ra="ranger"
type colorls > /dev/null
if [[ "$?" == "0" ]]; then
	alias cll="colorls -l --sd"
	alias cla="colorls -a --sd"
	alias clla="colorls -l -a --sd"
	alias cls="colorls --sd"
fi

###############################
# export environment variable
###############################
export PATH="$PATH:$HOME/my/src/nodejs/bin"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/my/bin"
export PATH="$PATH:$HOME/.local/bin"

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
if [ -f $HOME/my/src/hhistory/hhistory.sh ]; then
	source $HOME/my/src/hhistory/hhistory.sh
fi
