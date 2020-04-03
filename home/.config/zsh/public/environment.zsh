#! /usr/bin/env zsh

################################################################################

# LS_COLORS
#   ls - list directory contents
#
# Using color to distinguish file types is disabled both by default and with
# --color=never.  With --color=auto, ls emits color codes only when standard
# output is connected to a terminal.  The LS_COLORS environment variable can
# change the settings.  Use the dircolors command to set it.

if type dircolors > /dev/null; then
  eval "$(dircolors ${HOME}/.config/dircolors/database)"
fi
