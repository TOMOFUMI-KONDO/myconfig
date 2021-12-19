alias ..='cd ..'
alias ...='cd ../..'

alias mkdir='mkdir -p'
alias relogin='exec $SHELL -l'
alias rl='relogin'

alias ls='exa --time-style=long-iso -g'
alias ll='ls --git --time-style=long-iso -agl'
alias l1='exa -1'

alias md='vim ./*.md'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias ga='git add'
alias gc='git commit -m'
alias gs='git status'
alias gd='git diff'
alias gds='git diff --staged'
alias gl='git log'
alias gb='git branch'
alias gcb='git checkout -b'
alias gsw='git switch'

alias diff='diff -u'

alias lscd='cd "$(ls | peco)"'

function tm() {
  if [ -n "${1}" ]; then
    tmux attach-session -t ${1} || \
    tmux new-session -s ${1}
  else
    tmux attach-session || \
    tmux new-session
  fi
}

function docker-tags {
  curl -s https://registry.hub.docker.com/v1/repositories/$1/tags | jq -r '.[].name'
}

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"
. /Users/tomo/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

export EDITOR="vim"
export PATH=$HOME/.nodebrew/current/bin:$PATH

# HSTR configuration - add this to ~/.zshrc
alias hh=hstr                    # hh to be alias for hstr
setopt histignorespace           # skip cmds w/ leading space from history
export HSTR_CONFIG=hicolor       # get more colors
bindkey -s "\C-r" "\C-a hstr -- \C-j"     # bind hstr to Ctrl-r (for Vi mode check doc)

# Completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

# AWS CLI completion
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C '/usr/local/bin/aws_completer' aws

# Go SDK
alias go1.16.9="$HOME/sdk/go1.16.9/bin/go"

# Flutter
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# rbenv
eval "$(rbenv init - zsh)"
export PATH="$HOME/.rbenv/shims:$PATH"
alias pod="$HOME/.rbenv/shims/pod"

bindkey -e
