#!/usr/bin/env bash

alias diff="diff --color=auto -u"

alias ffmpeg="ffmpeg -hide_banner"

alias ffprobe="ffprobe -hide_banner"

alias grep="grep --color=auto"

alias ls="ls --color=always -ahl"

if type -t trash > /dev/null; then
  alias rm="trash"
fi

alias ssv="vagrant ssh"

alias vbox="VBoxManage"

alias vh="vagrant halt"

alias vs="vagrant status"

alias vu="vagrant up"
