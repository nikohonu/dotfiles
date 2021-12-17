# basic
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd
bindkey -v

zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
autoload -U colors && colors
compinit

# prompt
PROMPT="%{$fg[green]%}%M%{$reset_color%} [%D{%H:%M:%S}] in %{$fg[yellow]%}%~%{$fg[red]%}%#%{$reset_color%} "

# plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# bindkey
bindkey "^[[3~" delete-char
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# aliases
alias cal='cal -m'
alias cn='nvim ~/documents/notes.md'
alias cqt="code ~/.config/qtile/config.py"
alias cas="code ~/.config/qtile/autostart.sh"
alias f2clip="xclip -sel clip <"

alias rzshrc='source ~/.zshrc'
alias ezshrc='$EDITOR ~/.zshrc'
alias ezprofile='$EDITOR ~/.zprofile'

alias t='topydo -t ~/.local/share/topydo/todo.txt -d ~/.local/share/topydo/done.txt'
alias td='t do'
alias tall='t ls -g due'
alias tt='t ls due:=today'
alias ct='code ~/.local/share/topydo/todo.txt'

alias pain='paup; paru -S'
alias pare='paru -Rncs'
alias paup='paru -Suy'
alias pacl='pare $(paru -Qdtq)'

if [[ $(hostnamectl hostname) == arch0 ]]
then
fi

if [[ $(hostnamectl hostname) == arch1 ]]
then
    TERM=xterm-256color
fi