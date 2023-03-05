# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export TERM="xterm-256color"
export BROWSER="google-chrome"

# Path 
export PATH=$HOME/.local/bin:$PATH

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Go
export GOPATH="$HOME/Developer/go"
export PATH="$GOPATH/bin:$PATH"

# Latex
export PATH=/usr/local/texlive/2022/bin/universal-darwin:$PATH


# Neovim
export EDITOR="nvim"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(evalcache 
        fast-syntax-highlighting 
        zsh-completions 
        zsh-autosuggestions
        zsh-autopair
        fzf-tab
        rust
        )

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias vi="nvim"
alias vim="nvim"
alias g="git"
alias ..="cd .."
alias cat="bat"
alias grep="rg"
alias ~="cd ~"
alias lsi='logo-ls'
alias ls='exa' 
alias l='exa -lbF' 
alias ll='exa -la --icons' 
alias llm='ll --sort=modified' 
alias la='exa -lbhHigUmuSa --icons' 
alias lx='exa -lbhHigUmuSa@' 
alias tree='exa --tree' 
alias :q='exit' 
alias cl="clear"
alias celar="clear"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

_evalcache fnm env --use-on-cd
_evalcache zoxide init zsh

