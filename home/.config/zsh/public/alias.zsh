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

alias c="cd ${$(xdg-user-dir "CODE" 2> /dev/null):-${HOME}/Code}"

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

alias dotenv="dotenv-exec"

################################################################################

# ffm
#   ffmpeg
#
#   ffmpeg - ffmpeg video converter

alias ffm="ffmpeg -hide_banner"

################################################################################

# ffp
#   ffprobe
#
#   ffprobe - ffprobe media prober

alias ffp="ffprobe -hide_banner"

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

# l{1,4}a?
#
# lsd - ls deluxe
#
# -a, --all
#   Do not ignore entries starting with .
#
# -l, --long
#   Display extended file metadata as a table
#
# --tree
#   Recurse into directories and present the result as a tree
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
#   with -l and -s, print sizes like 1K 234M 2G etc
#
# -l
#   use a long listing format
#
# -R, --recursive
#   list subdirectories recursively

if type lsd > /dev/null; then
  alias l="lsd"
  alias la="lsd --all"
  alias ll="lsd --long"
  alias lla="lsd --all --long"
  alias lll="lsd --tree"
  alias llla="lsd --all --tree"
  alias llll="lsd --long --tree"
  alias lllla="lsd --all --long --tree"
else
  alias l="ls --color=auto"
  alias la="ls --all --color=auto"
  alias ll="ls --color=auto --human-readable -l"
  alias lla="ls --all --color=auto --human-readable -l"
  alias lll="ls --color=auto --recursive"
  alias llla="ls --all --color=auto --recursive"
  alias llll="ls --color=auto --human-readable -l --recursive"
  alias lllla="ls --all --color=auto --human-readable -l --recursive"
fi
