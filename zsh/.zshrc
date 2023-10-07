export ZSH="$HOME/.oh-my-zsh"
export TERM="xterm-256color"
export EDITOR="nvim"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.scripts:$PATH"

export GOPATH="$HOME/Developer/go"
export PATH="$GOPATH/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.bun/bin:$PATH"

ZSH_THEME=""

plugins=(git fast-syntax-highlighting zsh-completions zsh-autosuggestions extract rust yarn docker npm)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

source $ZSH/oh-my-zsh.sh

alias ~="cd ~"
alias vi="nvim"
alias vim="nvim"
alias ls="lsd"
alias ll="lsd -l"
alias :q="exit"
alias tree="lsd --tree --ignore-glob 'node_modules' --ignore-glob '.git'"
alias mv="mv -iv"
alias cp="cp -riv"
alias mkdir="mkdir -vp"
alias rm="rm -ir"
alias vim="nvim"
alias ports="sudo lsof -i -P -n | grep LISTEN"
alias cat="bat"
alias net="dotnet"

export PATH="/home/betty/.local/share/fnm:$PATH"
eval "$(fnm env --use-on-cd)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(rbenv init - zsh)"


# bun completions
[ -s "/Users/betty/.bun/_bun" ] && source "/Users/betty/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
