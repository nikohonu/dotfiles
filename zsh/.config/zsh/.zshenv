# Allow path and PATH contain only unique values
typeset -U path PATH

# Adding path to path
path+=~/.local/share/cargo/bin
path+=~/.local/bin/
path+=~/bin
path+=~/.bun/bin

export EDITOR=nvim

# Source every file in ~/.config/zsh/env
for file in "$ZDOTDIR"/env/*.zsh; do source $file; done
