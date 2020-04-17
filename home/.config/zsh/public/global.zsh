#! /usr/bin/env zsh

################################################################################

# DIRSTACKSIZE
#   zsh - the Z shell
#
# The maximum size of the directory stack, by default there is no limit.  If the
# stack gets larger than this, it will be truncated automatically.  This is
# useful with the AUTO_PUSHD option.

declare -g DIRSTACKSIZE="20"

################################################################################

# GIT_PS1_SHOWDIRTYSTATE
#   git-prompt.sh - allows you to see repository status in your prompt
#
# In addition, if you set GIT_PS1_SHOWDIRTYSTATE to a nonempty value,
# unstaged (*) and staged (+) changes will be shown next to the branch name.
# You can configure this per-repository with the bash.showDirtyState variable,
# which defaults to true once GIT_PS1_SHOWDIRTYSTATE is enabled.

declare -g GIT_PS1_SHOWDIRTYSTATE="1"

################################################################################

# GIT_PS1_SHOWSTASHSTATE
#   git-prompt.sh - allows you to see repository status in your prompt
#
# You can also see if currently something is stashed, by setting
# GIT_PS1_SHOWSTASHSTATE to a nonempty value.  If something is stashed, then a
# '$' will be shown next to the branch name.

declare -g GIT_PS1_SHOWSTASHSTATE="1"

################################################################################

# GIT_PS1_SHOWUNTRACKEDFILES
#   git-prompt.sh - allows you to see repository status in your prompt
#
# If you would like to see if there're untracked files, then you can set
# GIT_PS1_SHOWUNTRACKEDFILES to a nonempty value.  If there're untracked files,
# then a '%' will be shown next to the branch name.  You can configure this
# per-repository with the bash.showUntrackedFiles variable, which defaults to
# true once GIT_PS1_SHOWUNTRACKEDFILES is enabled.

declare -g GIT_PS1_SHOWUNTRACKEDFILES="1"

################################################################################

# HISTFILE
#   zsh - the Z shell
#
# The file to save the history in when an interactive shell exits.  If unset,
# the history is not saved.

declare -g HISTFILE="${HOME}/.cache/zsh/history"

################################################################################

# HISTSIZE
#   zsh - the Z shell
#
# The maximum number of events stored in the internal history list.  If you use
# the HIST_EXPIRE_DUPS_FIRST option, setting this value larger than the SAVEHIST
# size will give you the difference as a cushion for saving duplicated history
# events.

declare -g HISTSIZE="1000"

################################################################################

# LISTMAX
#   zsh - the Z shell
#
# In the line editor, the number of matches to list without asking first.  If
# the value is negative, the list will be shown if it spans at most as many
# lines as given by the absolute value.  If set to zero, the shell asks only if
# the top of the listing would scroll off the screen.

declare -g LISTMAX="0"

################################################################################

# OS_RELEASE_*
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

local os_release
if [[ -e "/etc/os-release" ]]; then
  os_release="/etc/os-release"
elif [[ -e "/usr/lib/os-release" ]]; then
  os_release="/usr/lib/os-release"
fi
if [[ -n "${os_release}" ]]; then
  while read -r os_release; do
    eval "OS_RELEASE_${os_release}"
  done < "${os_release}"
fi
unset os_release

################################################################################

# PS1
#   zsh - the Z shell
#
# The primary prompt string, printed before a command is read.  It undergoes a
# special form of expansion before being displayed; see EXPANSION OF PROMPT
# SEQUENCES in zshmisc(1).  The default is `%m%# '.

declare -g PS1=$'$(__ps1)\n\$ '

################################################################################

# SAVEHIST
#   zsh - the Z shell
#
# The maximum number of history events to save in the history file.

declare -g SAVEHIST="1000"

################################################################################

# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE
#   zsh-autosuggestions - Fish-like autosuggestions for zsh
#
# Set ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE to configure the style that the suggestion
# is shown with.  Background color can also be set, and the suggestion can be
# styled bold, underlined, or standout.  For more info, read the Character
# Highlighting section of the zsh manual: man zshzle.

declare -g ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#5C6370"
