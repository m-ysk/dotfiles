# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=nvim

alias ls='ls -a --color=auto'
alias ll='ls -l'

alias mv='mv -i'

alias mkdir='mkdir -p'

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gl='git log'
alias glo='git log --oneline'
alias gsu='git submodule update'

alias v='nvim'

# powerline
powerline-daemon -q
. /usr/share/powerline/bindings/zsh/powerline.zsh

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

bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey '^P' peco-history-selection

