#! /usr/bin/env zsh

# ALIASING
#
# Every eligible word in the shell input is checked to see if there is an alias defined
# for it.  If so, it is replaced by the text of the alias if it is in command
# position (if it could be the first word of a simple command), or if the alias
# is global.  If the replacement text ends with a space, the next word in the
# shell input is always eligible for purposes of alias expansion.  An alias is
# defined using the alias builtin; global aliases may be defined using the -g
# option to that builtin.

################################################################################

# c
#   cd "${HOME}/Code"
#
# cd — change the working directory

alias c="cd ${HOME}/Code"

################################################################################

# dif
#   diff --color=auto  --unified
#
# GNU diff - compare files line by line
#
# --color[=WHEN]
#   colorize the output; WHEN can be 'never', 'always', or 'auto' (the default)
#
# -u, -U NUM, --unified[=NUM]
#   output NUM (default 3) lines of unified context

alias dif="diff --color=auto --unified"

################################################################################

# g
#   git
#
#   git - the stupid content tracker

alias g="git"

################################################################################

# gr
#   grep --color=auto --ignore-case
#
# grep - print lines that match patterns
#
# --color[=WHEN], --colour[=WHEN]
#   Surround the matched (non-empty) strings, matching lines, context lines,
#   file names, line numbers, byte offsets, and separators (for fields and
#   groups of context lines) with escape sequences to display them in color on
#   the terminal.  The colors are  defined  by  the  environment variable
#   GREP_COLORS.  The deprecated environment variable GREP_COLOR is still
#   supported, but its setting does not have priority.  WHEN is never, always,
#   or auto.
#
# -i, --ignore-case
#   Ignore case distinctions in patterns and input data, so that characters that
#   differ only in case match each other.

alias gr="grep --color=auto --ignore-case"

################################################################################

# l
#   ls --all --color=auto --human-readable -l
#
# ls - list directory contents
#
# -a, --all
#   do not ignore entries starting with .
#
# --color[=WHEN]
#   colorize the output; WHEN can be 'always' (default if omitted), 'auto', or
#   'never'
#
# -h, --human-readable
#   with -l and -s, print sizes like 1K 234M 2G etc.
#
# -l
#   use a long listing format

alias l="ls --all --color=auto --human-readable -l"

################################################################################

# ll
#   ls --color=auto --human-readable -l
#
# ls - list directory contents
#
# --color[=WHEN]
#   colorize the output; WHEN can be 'always' (default if omitted), 'auto', or
#   'never'
#
# -h, --human-readable
#   with -l and -s, print sizes like 1K 234M 2G etc.
#
# -l
#   use a long listing format

alias ll="ls --color=auto --human-readable -l"
