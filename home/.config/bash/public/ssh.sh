#! /usr/bin/env bash

# HACK
#
# The `pinentry` (gpg password prompt) program *requires* that the
# `/dev/{pts,tty}` file representing the current terminal be _owned_ by the
# current _user_.  The `sudo` program does not change the user ownership of this
# file, so when called from a `sudo` environment, `ssh` fails with a cryptic
# message like "sign_and_send_pubkey: signing failed: agent refused operation".
#
# https://wiki.archlinux.org/index.php/GnuPG#su
function ssh() {
  if [[ -n "${SUDO_UID}" ]]; then
    chown root "$(tty)"
  fi

  command ssh "${@}"

  if [[ -n "${SUDO_UID}" ]]; then
    chown "${SUDO_UID}" "$(tty)"
  fi
}
