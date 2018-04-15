#!/usr/bin/env bash

if [[ -f /etc/motd ]]; then
  if ! shopt -q login_shell; then
    cat /etc/motd
  fi
fi
