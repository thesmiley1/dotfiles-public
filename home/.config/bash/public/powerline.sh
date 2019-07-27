#! /usr/bin/env bash

# powerline-daemon - Daemon that improves powerline performance
#
# --quiet, -q
#   Without other options: do not complain about already running
#   powerline-daemon instance.  Will still exit with 1.  With --kill and
#   --replace: do not show any messages.  With --foreground: ignored.  Does not
#   silence exceptions in any case.
if type -t powerline-daemon > /dev/null; then
  powerline-daemon -q
fi
