export ZSH="$HOME/.oh-my-zsh"
export TERM="xterm-256color"
export BROWSER="google-chrome"

# Path 
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/share/bin/:$PATH

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Go
export GOPATH=$HOME/Developer/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

#kafka
export PATH=/usr/local/opt/kafka/bin/:$PATH

# Latex
export PATH=/usr/local/texlive/2022/bin/universal-darwin:$PATH


# Neovim
export EDITOR="nvim"

plugins=(
        fast-syntax-highlighting 
        zsh-completions 
        zsh-autosuggestions
        rust
        docker
        docker-compose
        z
        )
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

source $ZSH/oh-my-zsh.sh


alias vi="nvim"
alias vim="nvim"
alias g="git"
alias ..="cd .."
alias cat="bat"
alias grep="rg"
alias ~="cd ~"
alias ls="lsd"
alias ll="lsd -l"
alias tree="lsd --tree --ignore-glob 'node_modules' --ignore-glob '.git'"
alias :q='exit' 
alias cl="clear"
alias celar="clear"

eval "$(starship init zsh)"
eval $(thefuck -alias)
eval "$(github-copilot-cli alias -- "$0")"

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


