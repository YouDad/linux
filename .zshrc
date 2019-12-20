# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom"
source $HOME/.profile

###############################
# zsh setting
###############################

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000

###############################
# theme
###############################
if false && [ -e $MY_SRC/powerlevel9k/powerlevel9k.zsh-theme ]; then
	if [ ! -e $ZSH_CUSTOM/powerlevel9k.zsh-theme ]; then
		ln -sf $MY_SRC/powerlevel9k/powerlevel9k.zsh-theme $ZSH_CUSTOM/
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
elif [ -e $ZSH_CUSTOM/dracula.zsh-theme ]; then
	ZSH_THEME="dracula"
else
	ZSH_THEME="robbyrussell"
fi

###############################
# is remote ?
###############################
remote=`who am i | wc | sed "s/ //g"`

if [[ $remote != "000" ]]; then
	echo "Welcome, SSH_USER, "`who am i`
	if [[ $ZSH_THEME == "powerlevel9k" ]]; then
		if [ -e $ZSH_CUSTOM/dracula.zsh-theme ]; then
			ZSH_THEME="dracula"
		else
			ZSH_THEME="robbyrussell"
		fi
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

if [ -e "$ZSH_CUSTOM/plugins/h" ]; then
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

###############################
# user set
###############################
umask 022

###############################
# alias command
###############################
alias gvv="git status -vv"
alias grs="git restore --staged"

alias ra="ranger"

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
