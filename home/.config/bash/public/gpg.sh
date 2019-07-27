#! /usr/bin/env bash

function gpg-agent-reload() {
  GPG_TTY=$(tty)
  export GPG_TTY

  gpg-connect-agent reloadagent      /bye
  gpg-connect-agent updatestartuptty /bye
}
