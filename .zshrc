# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$ZSH-custom"

# Prompt theme
ZSH_THEME="oxide"

# Disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Disable marking untracked files under VCS as dirty. This makes repository status
# check for large repositories much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Format for the command execution time stamp shown in the history command output.
HIST_STAMPS="%d/%m/%Y %T"

# Plugins to load
# Standard plugins can be found in $ZSH/plugins/*
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git docker docker-compose yadm)

source $ZSH/oh-my-zsh.sh

# Set aliases
alias ll='ls -lh'
alias grep='grep --color=auto'
alias ap='ansible-playbook'
