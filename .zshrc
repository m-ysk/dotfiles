# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=nvim

#alias ls='ls -a --color=auto'
#alias ll='ls -l'

alias mv='mv -i'

alias mkdir='mkdir -p'

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

alias gs='git status'
alias ga='git add'
alias gc='git commit -v'
alias gch='git checkout'
alias gres='git reset'
alias greb='git rebase'
alias gm='git merge'
alias gsta='git stash'
alias gsw='git switch'
alias gf='git fetch'
alias gp='git pull'
alias gl='git log'
alias glo='git log --oneline'
alias gd='git diff'
alias gsu='git submodule update --init --recursive'

alias v='nvim'

# fasd
alias a='fasd -a'
alias s='fasd -si'
alias d='fasd -d'
alias f='fasd -f'
alias sd='fasd -sid'
alias sf='fasd -sif'
alias z='fasd_cd -d'
alias zz='fasd_cd -d -i'
eval "$(fasd --init posix-alias zsh-hook)"

alias dk='docker'
alias docker-rm-all='docker ps -aq | xargs docker rm'
alias docker-rmi-all='docker images -aq | xargs docker rmi'
alias dc='docker-compose'

alias k='kubectl'

alias cc='cargo check'
alias ct='cargo test'

alias uberproto='docker run -it --rm -v "$(pwd)":/work uber/prototool:latest prototool all'

alias rust-musl-builder='docker run --rm -it -v "$(pwd)":/home/rust/src ekidd/rust-musl-builder'

# starship
export STARSHIP_CONFIG=~/dotfiles/starship.toml
eval "$(starship init zsh)"

eval "$(pyenv init -)"

export XDG_CONFIG_HOME=$HOME/.config

source /usr/share/nvm/init-nvm.sh

eval "$(direnv hook zsh)"

# history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=1000000

setopt inc_append_history
setopt share_history
setopt hist_ignore_all_dups

# peco
function peco-history-selection() {
	BUFFER=`history -n 1 | tac | awk '!a[$0]++' | peco`
	CURSOR=$#BUFFER
	zle reset-prompt
}

zle -N peco-history-selection

stty -ixon

bindkey -e
bindkey \^U backward-kill-line
bindkey '^P' peco-history-selection

# fzf
function select-history() {
	BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
	CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Rust
export RUSTC_WRAPPER=$(which sccache)
