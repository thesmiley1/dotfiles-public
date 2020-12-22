#! /usr/bin/env sh


# # Profile
#
# - <https://help.ubuntu.com/community/EnvironmentVariables#A.2BAH4-.2F.profile>
# - <https://unix.stackexchange.com/a/46856/370812>
#
# Where is some good _primary source_ information about this?
#
# - <http://zsh.sourceforge.net/Doc/Release/Files.html#Startup_002fShutdown-Files>
# - <https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html>
#
#
# ## NB
#
# This file is read by _login_ shells and desktop environments; it is _not_ read
# for all interactive shells.  Except bash does not read it if `.bash_profile`
# is present, _unless_ bash is invoked as `sh`.  And zsh does not use it at all,
# preferring to use `.zprofile`.
#
# In practice this means that this file will be loaded automatically by desktop
# environments and can be sourced in the shell-specific profile file to be
# loaded in login shells.  Since one of the targets of this file is graphical
# environments, the only thing it is used for is setting environment variables.


# ## XDG base directory environment variables
#
# Defines base directories relative to which files should be located
#
# <https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html#:~:text=Environment%20variables,-%24XDG_DATA_HOME>
#
#
# ### NB
#
# These variables are assigned as soon as possible so that they are always
# available for using in assignment to other variables, including immediately
# below.


# ### XDG_CACHE_HOME
#
# Base directory relative to which user specific non-essential data files should
# be stored
#
# <https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html#:~:text=XDG_CACHE_HOME,-defines>
export XDG_CACHE_HOME="${HOME}/.cache"


# ### XDG_CONFIG_HOME
#
# Base directory relative to which user specific configuration files should be
# stored
#
# <https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html#:~:text=XDG_CONFIG_HOME,-defines>
export XDG_CONFIG_HOME="${HOME}/.config"


# ### XDG_DATA_HOME
#
# Base directory relative to which user specific data files should be stored
#
# <https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html#:~:text=XDG_DATA_HOME,-defines>
export XDG_DATA_HOME="${HOME}/.local/share"


. "${XDG_CONFIG_HOME}/profile/public.sh"
