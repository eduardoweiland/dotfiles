export LANG="pt_BR.UTF-8"
export EDITOR="nvim"
export COMPOSE_HTTP_TIMEOUT=240
export DOCKER_CLIENT_TIMEOUT=240
export COMPOSER_MEMORY_LIMIT=4G

path=($HOME/bin $HOME/.local/bin $HOME/.cargo/bin $path)

if which yarn &> /dev/null
then
    path=($(yarn global bin) $path)
fi
if which composer &> /dev/null
then
    path=($(composer global config bin-dir --absolute -q) $path)
fi

export PATH
