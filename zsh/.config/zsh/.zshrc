# Load antidote
source ~/git/zsh/antidote/antidote.zsh
antidote load

# Load functions
autoload -Uz compinit promptinit

# Call functions
compinit
promptinit

# Fix empty line before prompt
print() {
  [ 0 -eq $# -a "prompt_pure_precmd" = "${funcstack[-1]}" ] || builtin print "$@";
}

# Set current prompt
prompt pure

# Vi mode
bindkey -v

# Source every file in ~/.config/zsh/rc
for file in "$ZDOTDIR"/rc/*.zsh; do source $file; done

# History
HISTFILE="$ZDOTDIR"/histfile
HISTSIZE=2000
SAVEHIST=2000
setopt SHARE_HISTORY

# Show fastfetch on start
fastfetch
