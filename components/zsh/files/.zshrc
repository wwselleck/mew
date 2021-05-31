#https://stackoverflow.com/questions/10735574/include-source-script-if-it-exists-in-bash
include () {
    [[ -f "$1" ]] && source "$1"
}

source ${ZSH_PLUGINS}/zsh-autosuggestions/zsh-autosuggestions.zsh
source ${ZSH_PLUGINS}/ohmyzsh/lib/completion.zsh
source ${ZSH_PLUGINS}/ohmyzsh/lib/history.zsh
source ${ZSH_PLUGINS}/zsh-history-substring-search/zsh-history-substring-search.zsh

include ~/.zshrc.local

if [[ -d "$MEW_DATA_DIR/zsh/localZshrcs" ]]; then
  for file in "$MEW_DATA_DIR/zsh/localZshrcs"/*; do
    echo $file
    source "$file"
  done
fi

unsetopt BEEP

export PATH="$HOME/bin:/usr/local/bin:/home/weston/.local/bin:$PATH"

# LS Aliases
alias l='ls -laFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list

######################
# Completion
######################
autoload -Uz compinit && compinit
_comp_options+=(globdots) # With hidden files
setopt auto_menu

######################
# History
######################
# Max # lines kept in a session
export HISTSIZE=50000
export HISTFILE="$XDG_DATA_HOME/.zsh_history"
# Max # lines kept in HISTFILE
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups
setopt extended_history
setopt inc_append_history
# Don't add commands that start with a space to history
setopt histignorespace
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^r' history-incremental-search-backward
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


#zstyle ':completion:*' list-suffixes 
#zstyle ':completion:*' expand prefix suffix 
setopt CORRECT
setopt CORRECT_ALL
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line

######################
# Python
######################
# Paths are set in .zshenv
export PYENV_VERSION="3.9.5"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
export PATH="$HOME/.poetry/bin:$PATH"


######################
# Go
######################
export PATH="$HOME/go/bin:$PATH"

######################
# Neovim
######################
alias n='nvim'

######################
# FZF
######################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias fzf="fzf --preview 'cat {}'"
export FZF_DEFAULT_COMMAND="rg --files --hidden -g '!.git/*'"
export FZF_DEFAULT_OPTS="--preview \"cat {}\""


######################
# Docker
######################
# Docker Aliaes
# https://hackernoon.com/handy-docker-aliases-4bd85089a3b8

dkclean() {
  docker rm $(docker ps --all -q -f status=exited)
  docker volume rm $(docker volume ls -qf dangling=true)
}
alias dm='docker-machine'
alias dmx='docker-machine ssh'
alias dk='docker'
alias dki='docker images'
alias dks='docker service'
alias dkrm='docker rm'
alias dkl='docker logs'
alias dklf='docker logs -f'
dkln() {
  docker logs -f `docker ps | grep $1 | awk '{print $1}'`
}
alias dkflush='docker rm `docker ps --no-trunc -aq`'
alias dkflush2='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'
alias dkt='docker stats --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.NetIO}}"'
alias dkps="docker ps --format '{{.ID}} ~ {{.Names}} ~ {{.Status}} ~ {{.Image}}'"

eval "$(starship init zsh)"

######################
# Node
######################
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm alias default v14.15.1

