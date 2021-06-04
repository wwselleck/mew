# It is very important that Pyenv is initalized AFTER .zshenv
# For reasons I'm not entirely clear on, the default PATHs (/usr/local/bin, /usr/bin, etc)
# Are set after .zshenv is run. So if you set a path in .zshenv, the default paths will take precendence
# .zprofile runs after the default PATHs are set, so paths added here will take precendence over the defaults.
# https://unix.stackexchange.com/questions/246751/how-to-know-why-and-where-the-path-env-variable-is-set/250456
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PYENV_VERSION="3.9.5"
eval "$(pyenv init --path)"
