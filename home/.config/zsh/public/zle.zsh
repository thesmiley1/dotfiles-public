#! /usr/bin/env zsh

# zshzle - zsh command line editor

# Selects keymap `viins' for any operations by the current command, and also
# links `viins' to `main' so that it is selected by default the next time the
# editor starts.
bindkey -v

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Executed every time the keymap changes, i.e. the special parameter KEYMAP is
# set to a different value, while the line editor is active.  Initialising the
# keymap when the line editor starts does not cause the widget to be called.
#
# The value $KEYMAP within the function reflects the new keymap.  The old keymap
# is passed as the sole argument.
#
# This can be used for detecting switches between the vi command (vicmd) and
# insert (usually main) keymaps.
function zle-keymap-select {
  zle reset-prompt
}
zle -N zle-keymap-select

# Executed every time the line editor is started to read a new line of input.
function zle-line-init {
  local date_out
  date_out="$(date +"%m/%d/%Y %H:%M:%S")"

  declare -g __PS1_DATE="${date_out% *}"

  declare -g __PS1_TIME="${date_out#* }"

  zle reset-prompt
}
zle -N zle-line-init
