#! /usr/bin/env bash

# All aliases are declared here.

# diff
#   GNU diff - compare files line by line
#
# --color[=WHEN]
#   colorize the output; WHEN can be 'never', 'always', or 'auto' (the default)
#
# -u, -U NUM, --unified[=NUM]
#   output NUM (default 3) lines of unified context
alias diff="diff --color=auto --unified"

# du
#   ncdu - NCurses Disk Usage
if type -t ncdu > /dev/null; then
  alias du="ncdu"
fi

# ffmpeg
#   ffmpeg - ffmpeg video converter
#
# -hide_banner
#   Suppress printing banner.
alias ffmpeg="ffmpeg -hide_banner"

# ffprobe
#   ffprobe - ffprobe media prober
#
# -hide_banner
#   Suppress printing banner.
alias ffprobe="ffprobe -hide_banner"

# grep
#   grep, egrep, fgrep - print lines that match patterns
#
# --color[=WHEN], --colour[=WHEN]
#   Surround the matched (non-empty) strings, matching lines, context lines,
#   file names, line numbers, byte offsets, and separators (for fields and
#   groups of context lines) with escape sequences to display them in color on
#   the terminal.  The colors are defined by the environment variable
#   GREP_COLORS.  The deprecated environment variable GREP_COLOR is still
#   supported, but its setting does not have priority.  WHEN is never, always,
#   or auto.
alias grep="grep --color=auto"

# ls
#   ls - list directory contents
#
# -a, --all
#   do not ignore entries starting with .
#
# --color[=WHEN]
#   colorize the output; WHEN can be 'always' (default if omitted), 'auto', or
#   'never'; more info below
#
# -h, --human-readable
#   with -l and -s, print sizes like 1K 234M 2G etc.
#
# -l
#   use a long listing format
alias ls="ls --all --color=always --human-readable -l"

# top
#   htop - interactive process viewer
if type -t htop > /dev/null; then
  alias top="htop"
fi

# npx
#   npx - execute npm package binaries
#
# --no-install
#   If passed to npx, it will only try to run <command> if it already exists in
#   the current path or in $prefix/node_modules/.bin. It won't try to  install
#   missing commands.
alias npx="npx --no-install"

# rm
#   trash-put - Command line trash utility.
if type -t trash-put > /dev/null; then
  alias rm="trash-put"
fi

alias ssv="vagrant ssh"

alias vbox="VBoxManage"

alias vh="vagrant halt"

alias vs="vagrant status"

alias vu="vagrant up"
