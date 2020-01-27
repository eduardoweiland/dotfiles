# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$ZSH-custom"

# Prompt theme
ZSH_THEME="oxide"

# Disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Disable marking untracked files under VCS as dirty. This makes repository status
# check for large repositories much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Format for the command execution time stamp shown in the history command output.
HIST_STAMPS="dd/mm/yyyy"

# Plugins to load
# Standard plugins can be found in $ZSH/plugins/*
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git docker-compose)

source $ZSH/oh-my-zsh.sh

test -r ~/.shell-env && source ~/.shell-env
test -r ~/.shell-aliases && source ~/.shell-aliases
