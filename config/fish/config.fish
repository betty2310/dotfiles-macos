set fish_greeting ""

starship init fish | source
zoxide init fish | source

# aliases
alias llt="exa --icons --git -a --tree -s type -I '.git|node_modules|bower_components|build'"
alias ls="logo-ls -XD"
alias ll="logo-ls -XDlh"
alias lla="exa --icons -la -B"
alias g git
alias fetch="rxfetch"
alias vi "nvim"
alias nv "nvim"
alias cl="clear"
alias cat="bat"
alias ide="tmux split-window -v -p 30"
alias za="zathura"
alias dots="~/.scripts/dots.sh"
alias fm="ranger"
alias pls="sudo"
alias py="python"

alias fomatem="java --module-path /Users/betty/Downloads/javafx-sdk-18.0-1.1/lib --add-modules=javafx.controls,javafx.fxml -Dfile.encoding=UTF-8 -jar /Users/betty/ghq/github.com/betty2310/FOMATEM/App/out/artifacts/App_jar/App.jar"   

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias :q='exit'

# alias for searching and installing packages
alias pacs="pacman -Slq | fzf -m --preview 'bat --color=always --theme=ansi (pacman -Si {1} | psub) (pacman -Fl {1} | psub |  awk \"{print \$2}\")' | xargs -ro sudo pacman -S"
# alias for searching and installing packages from AUR
alias yays="yay -Slq | fzf -m --preview 'bat (yay -Si {1} | psub) <(yay -Fl {1} | awk \"{print \$2}\" | psub)' | xargs -ro  yay -S"
# alias for searching and removing packages from system
alias pacr="pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"

alias mirror-update='sudo reflector -c Vietnam -c Japan -c Singapore -c India -a 12 --sort rate --save /etc/pacman.d/mirrorlist'

#color scheme

set -g EDITOR nvim
#set -x TERM xterm-256color
set -g man_bold -o green

# PATH
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/.bin $PATH
set -gx PATH ~/.scripts $PATH
set -gx PATH /usr/local/texlive/2021/bin/x86_64-linux/ $PATH
set -gx PATH /Applications/Postgres.app/Contents/Versions/14/bin $PATH
set -gx PATH /Users/betty/Library/Python/3.10/bin $PATH
fish_add_path /Users/betty/.spicetify

# NodeJS
set -gx PATH node_modules/.bin $PATH
set -gx PATH ~/.npm-global/bin $PATH

# Go
set -g GO ~/Developer/go
set -g GOPATH $HOME/go $PATH
set -g GOROOT /usr/local/opt/go/libexec $PATH
set -gx PATH $GOPATH/bin $PATH
set -gx PATH $GOROOT/bin $PATH

# Rust path

set -gx PATH ~/.cargo/bin $PATH

set -x THEFUCK_OVERRIDDEN_ALIASES 'git'

set -x FZF_DEFAULT_OPTS '--prompt="הּ "
    --color=hl:#81a1c1
    --color=hl+:#BF616A
    --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
    --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b --layout=reverse --border --margin=1 --padding=1'

#auto run tmux
#if status is-interactive
#and not set -q TMUX
#    exec tmux
#end
# random cool image
#colorscript -r

function fish_title
    set -q argv[1];
    # Looks like ~/d/fish: [git log]
    # or /e/apt: [fish]
    echo 🐟 (fish_prompt_pwd_dir_length=1 prompt_pwd) [$argv];
end

# colorscheme
# set nord0 2e3440
# set nord1 3b4252
# set nord2 434c5e
# set nord3 4c566a
# set nord4 d8dee9
# set nord5 e5e9f0
# set nord6 eceff4
# set nord7 8fbcbb
# set nord8 88c0d0
# set nord9 81a1c1
# set nord10 5e81ac
# set nord11 bf616a
# set nord12 d08770
# set nord13 ebcb8b
# set nord14 a3be8c
# set nord15 b48ead
#
set fish_color_normal brblack
set fish_color_command yellow 
set fish_color_redirection yellow 
set fish_color_end yelow 
set fish_color_error red 
set fish_color_match orange 
set fish_color_search_match blue 
set fish_color_escape purple 
set fish_color_cwd green 
set fish_color_autosuggestion brblack 
# set fish_color_user $nord4
# set fish_color_host $nord9
# set fish_color_cancel $nord15
set fish_pager_color_prefix yellow 
set fish_pager_color_completion brblack 
set fish_pager_color_description blue 
set fish_pager_color_progress green 
set fish_pager_color_secondary green 
set -U fish_color_param green
set -U fish_color_command brblue
set -U fish_color_operator green
set -U SPACEFISH_DIR_COLOR green
set -U fish_color_comment yellow
set -U fish_color_quote yellow

