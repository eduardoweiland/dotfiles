export LANG="pt_BR.UTF-8"
export EDITOR="nvim"
export COMPOSE_HTTP_TIMEOUT=240
export DOCKER_CLIENT_TIMEOUT=240
export COMPOSER_MEMORY_LIMIT=4G

path+=($HOME/bin $HOME/.local/bin $HOME/.cargo/bin)

if command -v yarn &> /dev/null
then
    path+=$(yarn global bin)
fi
if command -v composer &> /dev/null
then
    path+=$(composer global config bin-dir --absolute -q)
fi

if command -v fnm &> /dev/null
then
    eval $(fnm env)
fi

export PATH
