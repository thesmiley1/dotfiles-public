#! /usr/bin/env zsh

# completion matching case-insensitive and -/_ agnostic
# https://superuser.com/a/1092328
# https://unix.stackexchange.com/a/97349
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}'
