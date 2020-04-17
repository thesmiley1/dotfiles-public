#! /usr/bin/env zsh

autoload -Uz compinit
compinit -d "${XDG_CACHE_HOME:-${HOME}/.cache}/zsh/zcompdump"
