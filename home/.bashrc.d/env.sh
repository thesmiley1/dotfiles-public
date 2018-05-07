#!/usr/bin/env bash

# supposedly this is supposed to be a line editor...
# https://unix.stackexchange.com/a/334022
export EDITOR="vim"

# default options for less
# -i   search case insensitive by default
# -R   output raw ANSI color escape sequences (enable color output)
# -x2  output two spaces for tabs
export LESS="-iRx2"

# less is more, right?
export PAGER="less"

# append GOBIN or GOPATH/bin to PATH
if which go > /dev/null 2>&1; then
  if [[ -n $(go env GOBIN) ]]; then
    PATH="$PATH:$(go env GOBIN)"
  else
    PATH="$PATH:$(go env GOPATH)/bin"
  fi
fi

# a magic incation if there ever was one
export PS1="\[\033[0;35m\]\u\[\033[0;30m\]@\[\033[0;33m\]\h\[\033[0;30m\]:\[\033[0;34m\]\w\[\033[0;32m\]\$(__git_ps1 '(%s)')\[\033[0m\]\\\$ "

# visual editor
export VISUAL="vim"

# tell xz to always use as many threads as possible
export XZ_OPT="--threads=0"
