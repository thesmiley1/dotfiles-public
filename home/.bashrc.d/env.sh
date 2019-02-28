#!/usr/bin/env bash

# supposedly this is supposed to be a line editor...
# https://unix.stackexchange.com/a/334022
export EDITOR="vim"

# default options for less
# -i   search case insensitive by default
# -R   output raw ANSI color escape sequences (enable color output)
# -x2  output two spaces for tabs
export LESS="-iRx2"

# support syntax highlighting in less via source-highlight if available
if type -t src-hilite-lesspipe.sh > /dev/null; then
  export LESSOPEN="| src-hilite-lesspipe.sh %s"
fi

# use pygments instead of code2color with lesspipe
if type -t pygmentize > /dev/null; then
  export LESSCOLORIZER="pygmentize"
fi

# less is more, right?
export PAGER="less"

# append GOBIN or GOPATH/bin to PATH
if type -t go > /dev/null; then
  if [[ -n $(go env GOBIN) ]]; then
    PATH="$PATH:$(go env GOBIN)"
  else
    PATH="$PATH:$(go env GOPATH)/bin"
  fi
fi

# a magic incation if there ever was one
export PS1="\\[\\033[0;35m\\]\\u\\[\\033[0;30m\\]@\\[\\033[0;33m\\]\\h\\[\\033[0;30m\\]:\\[\\033[0;34m\\]\\w\\[\\033[0;32m\\]\$(__git_ps1 '(%s)')\\[\\033[0m\\]\\\$ "

# set SSH_AUTH_SOCK to point to gpg-agent socket, if it exists
if [[ -n "$XDG_RUNTIME_DIR" && -S "${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh" ]]; then
  export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh"
fi

# visual editor
export VISUAL="vim"

# tell xz to always use as many threads as possible
export XZ_OPT="--threads=0"
