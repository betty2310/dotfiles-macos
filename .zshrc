# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/.local/bin:$PATH
export PATH=/usr/local/texlive/2022/bin/universal-darwin:$PATH
export PATH=$HOME/go/bin/:$PATH


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias vi="nvim"
alias vim="nvim"
alias g="git"
alias ..="cd .."
alias cat="bat"
alias reload="source ~/.zshrc"
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


export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' 
	--color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff 
	--color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a 
  --layout=reverse --border --margin=1 --padding=1'

source /usr/local/share/antigen/antigen.zsh

antigen bundle Aloxaf/fzf-tab
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle hlissner/zsh-autopair
antigen bundle agkozak/zsh-z
antigen theme romkatv/powerlevel10k

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

antigen apply


export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

eval "$(rbenv init - zsh)"
# eval "$(starship init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
