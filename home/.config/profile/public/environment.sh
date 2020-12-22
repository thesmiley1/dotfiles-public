#! /usr/bin/env sh


# # Environment variables
#
# <https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap08.html>


# TODO
# Move bash/zsh exported environment variables here


# ## NPM_CONFIG_PREFIX
#
# The location to install global items
#
#
export NPM_CONFIG_PREFIX="${HOME}/.local"

# ## NPM_CONFIG_USERCONFIG
#
# Per-user config file
#
# <https://docs.npmjs.com/cli/v6/using-npm/config#npmrc-files>
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
