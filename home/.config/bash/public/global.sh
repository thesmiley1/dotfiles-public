#! /usr/bin/env bash

# shellcheck disable=2034

################################################################################

# GIT_PS1_SHOWDIRTYSTATE
#   git-prompt.sh - allows you to see repository status in your prompt
#
# In addition, if you set GIT_PS1_SHOWDIRTYSTATE to a nonempty value,
# unstaged (*) and staged (+) changes will be shown next to the branch name.
# You can configure this per-repository with the bash.showDirtyState variable,
# which defaults to true once GIT_PS1_SHOWDIRTYSTATE is enabled.

GIT_PS1_SHOWDIRTYSTATE=1

################################################################################

# GIT_PS1_SHOWSTASHSTATE
#   git-prompt.sh - allows you to see repository status in your prompt
#
# You can also see if currently something is stashed, by setting
# GIT_PS1_SHOWSTASHSTATE to a nonempty value.  If something is stashed, then a
# '$' will be shown next to the branch name.

GIT_PS1_SHOWSTASHSTATE=1

################################################################################

# GIT_PS1_SHOWUNTRACKEDFILES
#   git-prompt.sh - allows you to see repository status in your prompt
#
# If you would like to see if there're untracked files, then you can set
# GIT_PS1_SHOWUNTRACKEDFILES to a nonempty value.  If there're untracked files,
# then a '%' will be shown next to the branch name.  You can configure this
# per-repository with the bash.showUntrackedFiles variable, which defaults to
# true once GIT_PS1_SHOWUNTRACKEDFILES is enabled.

GIT_PS1_SHOWUNTRACKEDFILES=1

################################################################################

# HISTCONTROL
#   bash - GNU Bourne-Again SHell
#
# A colon-separated list of values controlling how commands are saved on the
# history list.  If the list of values includes ignorespace, lines which begin
# with a space character are not saved in the history list.  A value of
# ignoredups causes lines matching the previous history entry to not be saved.
# A value of ignoreboth is shorthand for ignorespace and ignoredups.  A value of
# erasedups causes all previous lines matching the current line to be removed
# from the history list before that line is saved.  Any value not in the above
# list is ignored.  If HISTCONTROL is unset, or does not include a valid value,
# all lines read by the shell parser are saved on the history list, subject to
# the value of HISTIGNORE.  The second and subsequent lines of a multi-line
# compound command are not tested, and are added to the history regardless of
# the value of HISTCONTROL.

HISTCONTROL="ignoreboth"

################################################################################

# HISTFILESIZE
#   bash - GNU Bourne-Again SHell
#
# The maximum number of lines contained in the history file.  When this variable
# is assigned a value, the history file is truncated, if necessary, to contain
# no more than that number of lines by removing the oldest entries.  The history
# file is also truncated to this size after writing it when a shell exits.   If
# the value is 0, the history file is truncated to zero size.  Non-numeric
# values and numeric values less than zero inhibit truncation.  The shell sets
# the default value to the value of HISTSIZE after reading any startup files.

HISTFILESIZE="2000"

################################################################################

# HISTSIZE
#   bash - GNU Bourne-Again SHell
#
# The number of commands to remember in the command history (see HISTORY below).
# If the value is 0, commands are not saved in the history list.   Numeric
# values less than zero result in every command being saved on the history list
# (there is no limit).  The shell sets the default value to 500 after reading
# any startup files.

HISTSIZE="1000"

################################################################################

# PATH
#   environ - user environment
#
# The sequence of directory prefixes that sh(1) and many other programs apply in
# searching for a file known by an incomplete pathname.  The prefixes are
# separated by ':'.  (Similarly one has CDPATH used by some shells to find the
# target of a change directory command, MANPATH used by man(1) to find manua
# pages, and so on)

# prepend $HOME/.local/bin to PATH if it exists
if [[ -d "$HOME/.local/bin" ]]; then
  PATH="$HOME/.local/bin:$PATH"
fi

# append GOBIN or GOPATH/bin to PATH if go is installed
if type -t go > /dev/null; then
  if [[ -n $(go env GOBIN) ]]; then
    PATH="$PATH:$(go env GOBIN)"
  else
    PATH="$PATH:$(go env GOPATH)/bin"
  fi
fi

################################################################################

# PS1
#   bash - GNU Bourne-Again SHell
#
# The value of this parameter is expanded (see PROMPTING below) and used as the
# primary prompt string.  The default value is ``\s-\v\$ ''.

PS1="\$(__my_ps1)\n\\\$ "

################################################################################

# __MY_OS_RELEASE_*
#   os-release - Operating system identification
#
# The following OS identifications parameters may be set using os-release:
#
# NAME=
#   A string identifying the operating system, without a version component, and
#   suitable for presentation to the user.
#   If not set, defaults to "NAME=Linux".
#   Example: "NAME=Fedora" or "NAME="Debian GNU/Linux"".
#
# VERSION=
#   A string identifying the operating system version, excluding any OS name
#   information, possibly including a release code name, and suitable for
#   presentation to the user.
#   This field is optional.
#   Example: "VERSION=17" or "VERSION="17 (Beefy Miracle)"".
#
# ID=
#   A lower-case string (no spaces or other characters outside of 0–9, a–z, ".",
#   "_" and "-") identifying the operating system, excluding any version
#   information and suitable for processing by scripts or usage in generated
#   filenames.
#   If not set, defaults to "ID=linux".
#   Example: "ID=fedora" or "ID=debian".
#
# ID_LIKE=
#   A space-separated list of operating system identifiers in the same syntax as
#   the ID= setting. It should list identifiers of operating systems that are
#   closely related to the local operating system in regards to packaging and
#   programming interfaces, for example listing one or more OS identifiers the
#   local OS is a derivative from. An OS should generally only list other OS
#   identifiers it itself is a derivative of, and not any OSes that are derived
#   from it, though symmetric relationships are possible. Build scripts and
#   similar should check this variable if they need to identify the local
#   operating system and the value of ID= is not recognized. Operating systems
#   should be listed in order of how closely the local operating system relates
#   to the listed ones, starting with the closest.
#   This field is optional.
#   Example: for an operating system with "ID=centos", an assignment of
#   "ID_LIKE="rhel fedora"" would be appropriate. For an operating system with
#   "ID=ubuntu", an assignment of "ID_LIKE=debian" is appropriate.
#
# VERSION_CODENAME=
#   A lower-case string (no spaces or other characters outside of 0–9, a–z, ".",
#   "_" and "-") identifying the operating system release code name, excluding
#   any OS name information or release version, and suitable for processing by
#   scripts or usage in generated filenames.
#   This field is optional and may not be implemented on all systems.
#   Examples: "VERSION_CODENAME=buster", "VERSION_CODENAME=xenial"
#
# VERSION_ID=
#   A lower-case string (mostly numeric, no spaces or other characters outside
#   of 0–9, a–z, ".", "_" and "-") identifying the operating system version,
#   excluding any OS name information or release code name, and suitable for
#   processing by scripts or usage in generated filenames.
#   This field is optional.
#   Example: "VERSION_ID=17" or "VERSION_ID=11.04".
#
# PRETTY_NAME=
#   A pretty operating system name in a format suitable for presentation to the
#   user. May or may not contain a release code name or OS version of some kind,
#   as suitable.
#   If not set, defaults to "PRETTY_NAME="Linux"".
#   Example: "PRETTY_NAME="Fedora 17 (Beefy Miracle)"".
#
# ANSI_COLOR=
#   A suggested presentation color when showing the OS name on the console. This
#   should be specified as string suitable for inclusion in the ESC [ m
#   ANSI/ECMA-48 escape code for setting graphical rendition.
#   This field is optional.
#   Example: "ANSI_COLOR="0;31"" for red, or "ANSI_COLOR="1;34"" for light blue.
#
# CPE_NAME=
#   A CPE name for the operating system, in URI binding syntax, following the
#   Common Platform Enumeration Specification[2] as proposed by the NIST.
#   This field is optional.
#   Example: "CPE_NAME="cpe:/o:fedoraproject:fedora:17""
#
# HOME_URL=, DOCUMENTATION_URL=, SUPPORT_URL=, BUG_REPORT_URL=,
# PRIVACY_POLICY_URL=
#   Links to resources on the Internet related to the operating system.
#   HOME_URL= should refer to the homepage of the operating system, or
#   alternatively some homepage of the specific version of the operating system.
#   DOCUMENTATION_URL= should refer to the main documentation page for this
#   operating system.  SUPPORT_URL= should refer to the main support page for
#   the operating system, if there is any. This is primarily intended for
#   operating systems which vendors provide support for.  BUG_REPORT_URL= should
#   refer to the main bug reporting page for the operating system, if there is
#   any. This is primarily intended for operating systems that rely on community
#   QA.  PRIVACY_POLICY_URL= should refer to the main privacy policy page for
#   the operating system, if there is any.
#   These settings are optional, and providing only some of these settings is
#   common. These URLs are intended to be exposed in "About this system" UIs
#   behind links with captions such as "About this Operating System", "Obtain
#   Support", "Report a Bug", or "Privacy Policy". The values should be in
#   RFC3986 format[3], and should be "http:" or "https:" URLs, and possibly
#   "mailto:" or "tel:". Only one URL shall be listed in each setting. If
#   multiple resources need to be referenced, it is recommended to provide an
#   online landing page linking all available resources.
#   Examples: "HOME_URL="https://fedoraproject.org/"" and
#   "BUG_REPORT_URL="https://bugzilla.redhat.com/""
#
# BUILD_ID=
#   A string uniquely identifying the system image used as the origin for a
#   distribution (it is not updated with system updates). The field can be
#   identical between different VERSION_IDs as BUILD_ID is an only a unique
#   identifier to a specific version. Distributions that release each update as
#   a new version would only need to use VERSION_ID as each build is already
#   distinct based on the VERSION_ID.
#   This field is optional.
#   Example: "BUILD_ID="2013-03-20.3"" or "BUILD_ID=201303203".
#
# VARIANT=
#   A string identifying a specific variant or edition of the operating system
#   suitable for presentation to the user. This field may be used to inform the
#   user that the configuration of this system is subject to a specific
#   divergent set of rules or default configuration settings.
#   This field is optional and may not be implemented on all systems.
#   Examples: "VARIANT="Server Edition"", "VARIANT="Smart Refrigerator Edition""
#   Note: this field is for display purposes only. The VARIANT_ID field should
#   be used for making programmatic decisions.
#
# VARIANT_ID=
#   A lower-case string (no spaces or other characters outside of 0–9, a–z, ".",
#   "_" and "-"), identifying a specific variant or edition of the operating
#   system. This may be interpreted by other packages in order to determine a
#   divergent default configuration.
#   This field is optional and may not be implemented on all systems.
#   Examples: "VARIANT_ID=server", "VARIANT_ID=embedded"
#
# LOGO=
#   A string, specifying the name of an icon as defined by freedesktop.org Icon
#   Theme Specification[4]. This can be used by graphical applications to
#   display an operating system's or distributor's logo.
#   This field is optional and may not necessarily be implemented on all
#   systems.
#   Examples: "LOGO=fedora-logo", "LOGO=distributor-logo-opensuse"
#
# If you are reading this file from C code or a shell script to determine the OS
# or a specific version of it, use the ID and VERSION_ID fields, possibly with
# ID_LIKE as fallback for ID. When looking for an OS identification string for
# presentation to the user use the PRETTY_NAME field.
#
# Note that operating system vendors may choose not to provide version
# information, for example to accommodate for rolling releases. In this case,
# VERSION and VERSION_ID may be unset. Applications should not rely on these
# fields to be set.
#
# Operating system vendors may extend the file format and introduce new fields.
# It is highly recommended to prefix new fields with an OS specific name in
# order to avoid name clashes.
# Applications reading this file must ignore unknown fields.
# Example: "DEBIAN_BTS="debbugs://bugs.debian.org/""
#
# EXAMPLE
#   NAME=Fedora
#   VERSION="17 (Beefy Miracle)"
#   ID=fedora
#   VERSION_ID=17
#   PRETTY_NAME="Fedora 17 (Beefy Miracle)"
#   ANSI_COLOR="0;34"
#   CPE_NAME="cpe:/o:fedoraproject:fedora:17"
#   HOME_URL="https://fedoraproject.org/"
#   BUG_REPORT_URL="https://bugzilla.redhat.com/"

if [[ -e "/etc/os-release" ]]; then
  __my_os_release="/etc/os-release"
elif [[ -e "/usr/lib/os-release" ]]; then
  __my_os_release="/usr/lib/os-release"
fi
if [[ -n "${__my_os_release}" ]]; then
  while read -r __my_os_release; do
    eval "__MY_OS_RELEASE_${__my_os_release}"
  done < "${__my_os_release}"
fi
