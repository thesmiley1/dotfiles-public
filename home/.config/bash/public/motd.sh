#!/usr/bin/env bash

# display MOTD in non-login shells
if [[ -f /etc/motd ]]; then
  if ! shopt -q login_shell; then
    cat /etc/motd
  fi
fi
