alias ..='cd ..'
alias ...='cd ../..'

alias mkdir='mkdir -p'
alias relogin='exec $SHELL -l'

alias ls='exa --time-style=long-iso -g'
alias ll='ls --git --time-style=long-iso -agl'
alias l1='exa -1'
alias lscd='cd "$(ls | peco)"'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias diff='diff -u'

alias glol='git log --graph --decorate --pretty=oneline --all --abbrev-commit'

export EDITOR="vim"

# completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'

# zsh autosuggtestion
. $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# starship
eval "$(starship init zsh)"

# tmux
function tm() {
  if [ -n "${1}" ]; then
    tmux attach-session -t ${1} || \
    tmux new-session -s ${1}
  else
    tmux attach-session || \
    tmux new-session
  fi
}

# docker
function docker-tags {
  curl -s https://registry.hub.docker.com/v1/repositories/$1/tags | jq -r '.[].name'
}

# homebrew
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

# aws-cli completion
autoload bashcompinit && bashcompinit
complete -C '/opt/homebrew/bin/aws_completer' aws

bindkey -e
