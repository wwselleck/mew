
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache

export MEW_DIR=~/dev/mew
export MEW_DATA_DIR=$XDG_DATA_HOME/mew


export ZSH_PLUGINS=${MEW_DIR}/components/zsh/files/plugins
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export VISUAL="nvim"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"


