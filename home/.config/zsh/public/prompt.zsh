#! /usr/bin/env zsh

function __ps1() {
  declare -r CURSOR_BEAM="\e[6 q"
  declare -r CURSOR_BLOCK="\e[2 q"

  local cursor
  case "${KEYMAP}" in
    vicmd)      cursor="${CURSOR_BLOCK}" ;;
    viins|main) cursor="${CURSOR_BEAM}" ;;
  esac

  echo "${__PS1_CACHE}${cursor}"
}

function __ps1_cache {
  declare -r _PIPESTATUS=($pipestatus)

  ##############################################################################
  #                                                                            #
  #                                Definitions                                 #
  #                                                                            #
  ##############################################################################

  ################################### Codes ####################################

  declare -r CODE_BACKGROUND="%K"
  declare -r       CODE_BOLD="%B"
  declare -r CODE_FOREGROUND="%F"
  declare -r    CODE_REGULAR="%b"
  declare -r      CODE_RESET="%k%b%f"

  ################################### Colors ###################################

  declare -r   COLOR_BLACK="{black}"
  declare -r    COLOR_BLUE="{blue}"
  declare -r    COLOR_CYAN="{cyan}"
  declare -r   COLOR_GREEN="{green}"
  declare -r COLOR_MAGENTA="{magenta}"
  declare -r     COLOR_RED="{red}"
  declare -r   COLOR_WHITE="{white}"
  declare -r  COLOR_YELLOW="{yellow}"

  ################################## Glyphs ####################################

  declare -r GLYPH_DIVIDER_RIGHT_HARD="\uE0B0" # 
  declare -r GLYPH_DIVIDER_RIGHT_SOFT="\uE0B1" # 

  ################################### Icons ####################################

  declare -r      ICON_APPLICATION="\uF3BB" # 
  declare -r             ICON_ARCH="\uF303" # 
  declare -r             ICON_BOMB="\uF1E2" # 
  declare -r             ICON_BOOK="\uF02D" # 
  declare -r        ICON_BRIEFCASE="\uF0F2" # 
  declare -r         ICON_CALENDAR="\uF073" # 
  declare -r        ICON_CHECKMARK="\uF00C" # 
  declare -r             ICON_CHIP="\uF2DB" # 
  # declare -r           ICON_CHROME="\uF268" # 
  declare -r            ICON_CLOCK="\uF017" # 
  declare -r        ICON_CLOCK_ALT="\uF346" # 
  declare -r             ICON_CODE="\uF121" # 
  declare -r        ICON_COG_MULTI="\uF085" # 
  declare -r       ICON_COG_SINGLE="\uF013" # 
  declare -r       ICON_CONTROLLER="\uF11B" # 
  declare -r             ICON_DATA="\uF1C0" # 
  declare -r       ICON_DATA_EMPTY="\uF395" # 
  declare -r          ICON_DESKTOP="\uF108" # 
  declare -r             ICON_DISK="\uF0A0" # 
  declare -r         ICON_DOWNLOAD="\uF019" # 
  declare -r      ICON_FILE_BINARY="\uF393" # 
  declare -r        ICON_FILE_CODE="\uF1C9" # 
  declare -r        ICON_FILE_COPY="\uF0C5" # 
  declare -r       ICON_FILE_EMPTY="\uF016" # 
  declare -r        ICON_FILE_TEXT="\uF0F6" # 
  declare -r             ICON_FLAG="\uF024" # 
  declare -r     ICON_FOLDER_ARROW="\uF3AE" # 
  declare -r     ICON_FOLDER_FRONT="\uF07B" # 
  declare -r      ICON_FOLDER_OPEN="\uF07C" # 
  declare -r         ICON_GIT_FILL="\uF1D2" # 
  declare -r           ICON_GITLAB="\uF296" # 
  declare -r            ICON_GLOBE="\uF3B0" # 
  declare -r             ICON_HOME="\uF015" # 
  # declare -r         ICON_I_CIRCLE="\uF359" # 
  declare -r    ICON_I_CIRCLE_FILL="\uF05A" # 
  declare -r           ICON_LAPTOP="\uF109" # 
  declare -r        ICON_LIGHTNING="\uF0E7" # 
  declare -r ICON_LOCK_FILL_CLOSED="\uF023" # 
  declare -r             ICON_MAIL="\uF33C" # 
  declare -r     ICON_MONITOR_FILL="\uF3CB" # 
  declare -r            ICON_MUSIC="\uF001" # 
  declare -r     ICON_OCTOCAT_FACE="\uF113" # 
  declare -r           ICON_PENCIL="\uF040" # 
  declare -r          ICON_PACKAGE="\uF3BA" # 
  declare -r          ICON_PENGUIN="\uF17C" # 
  declare -r    ICON_PENGUIN_SMALL="\uF31A" # 
  declare -r          ICON_PICTURE="\uF03E" # 
  # declare -r             ICON_PLUG="\uF1E6" # 
  declare -r            ICON_POWER="\uF011" # 
  declare -r          ICON_PRINTER="\uF02F" # 
  # declare -r           ICON_PROMPT="\uF120" # 
  declare -r      ICON_PROMPT_FILL="\uF3BE" # 
  declare -r    ICON_QUESTION_MARK="\uF128" # 
  declare -r           ICON_SERVER="\uF233" # 
  # declare -r             ICON_SIGN="\uF375" # 
  declare -r     ICON_SLIDERS_HORZ="\uF1DE" # 
  declare -r          ICON_TOOLBOX="\uF0B1" # 
  declare -r            ICON_TRUCK="\uF0D1" # 
  declare -r           ICON_UBUNTU="\uF31B" # 
  declare -r        ICON_USER_FILL="\uF007" # 
  declare -r       ICON_USER_MULTI="\uF0C0" # 
  declare -r     ICON_USER_OUTLINE="\uF2C0" # 
  declare -r            ICON_VIDEO="\uF008" # 
  declare -r           ICON_WRENCH="\uF0AD" # 

  local ICON_SPACE=" "
  if [[ "${COLORTERM}" == "kmscon" ]]; then
    ICON_SPACE=""
  fi

  ##############################################################################
  #                                                                            #
  #                                  Segments                                  #
  #                                                                            #
  ##############################################################################

  ################################ Mode Segment ################################

  local SEGMENT_MODE

  # local mode_color_bg="${COLOR_WHITE}"
  # local mode_color_fg="${COLOR_BLACK}"

  # SEGMENT_MODE="${SEGMENT_MODE}${CODE_BACKGROUND}${mode_color_bg}"
  # SEGMENT_MODE="${SEGMENT_MODE}${CODE_FOREGROUND}${mode_color_fg}"
  # SEGMENT_MODE="${SEGMENT_MODE} "

  # local mode_text="${${KEYMAP/vicmd/CMD}/(main|viins)/INS}"

  # SEGMENT_MODE="${SEGMENT_MODE}${mode_text}"
  # SEGMENT_MODE="${SEGMENT_MODE} "

  ################################ Date Segment ################################

  local SEGMENT_DATE

  local date_color_bg="${COLOR_CYAN}"
  local date_color_fg="${COLOR_BLACK}"

  # SEGMENT_DATE="${SEGMENT_DATE}${CODE_BACKGROUND}${date_color_bg}"
  # SEGMENT_DATE="${SEGMENT_DATE}${CODE_FOREGROUND}${mode_color_bg}"
  # SEGMENT_DATE="${SEGMENT_DATE}${GLYPH_DIVIDER_RIGHT_HARD}"
  # SEGMENT_DATE="${SEGMENT_DATE}${CODE_FOREGROUND}${date_color_fg}"
  # SEGMENT_DATE="${SEGMENT_DATE} "

  local date_out
  date_out="$(date +"%m/%d/%Y %H:%M:%S")"

  local date_date="${date_out% *}"

  local date_time="${date_out#* }"

  SEGMENT_DATE="${SEGMENT_DATE}${CODE_BACKGROUND}${date_color_bg}"
  SEGMENT_DATE="${SEGMENT_DATE}${CODE_FOREGROUND}${date_color_fg}"
  SEGMENT_DATE="${SEGMENT_DATE} "

  SEGMENT_DATE="${SEGMENT_DATE}${ICON_CALENDAR}${ICON_SPACE}${date_date}"
  SEGMENT_DATE="${SEGMENT_DATE} ${ICON_CLOCK}${ICON_SPACE}${date_time}"
  SEGMENT_DATE="${SEGMENT_DATE} "

  ################################ User Segment ################################

  local SEGMENT_USER

  local user_color_bg="${COLOR_MAGENTA}"
  local user_color_fg="${COLOR_BLACK}"

  local user_icon_regular="${ICON_USER_OUTLINE}"
  local user_icon_root="${ICON_USER_FILL}"

  SEGMENT_USER="${SEGMENT_USER}${CODE_BACKGROUND}${user_color_bg}"
  SEGMENT_USER="${SEGMENT_USER}${CODE_FOREGROUND}${date_color_bg}"
  SEGMENT_USER="${SEGMENT_USER}${GLYPH_DIVIDER_RIGHT_HARD}"
  SEGMENT_USER="${SEGMENT_USER}${CODE_FOREGROUND}${user_color_fg}"
  SEGMENT_USER="${SEGMENT_USER} "

  if [[ "${UID}" -eq 0 ]]; then
    SEGMENT_USER="${SEGMENT_USER}${CODE_BOLD}${user_icon_root}"
  else
    SEGMENT_USER="${SEGMENT_USER}${user_icon_regular}"
  fi

  SEGMENT_USER="${SEGMENT_USER}${ICON_SPACE}${USER}${CODE_REGULAR}"
  SEGMENT_USER="${SEGMENT_USER} "

  ############################## Hostname Segment ##############################

  local SEGMENT_HOSTNAME

  local hostname_color_bg="${COLOR_YELLOW}"
  local hostname_color_fg="${COLOR_BLACK}"

  local hostname_icon_local="${ICON_LAPTOP}"
  local hostname_icon_remote="${ICON_SERVER}"

  SEGMENT_HOSTNAME="${SEGMENT_HOSTNAME}${CODE_BACKGROUND}${hostname_color_bg}"
  SEGMENT_HOSTNAME="${SEGMENT_HOSTNAME}${CODE_FOREGROUND}${user_color_bg}"
  SEGMENT_HOSTNAME="${SEGMENT_HOSTNAME}${GLYPH_DIVIDER_RIGHT_HARD}"
  SEGMENT_HOSTNAME="${SEGMENT_HOSTNAME}${CODE_FOREGROUND}${hostname_color_fg}"
  SEGMENT_HOSTNAME="${SEGMENT_HOSTNAME} "

  if [[ -n "${SSH_CONNECTION}" ]]; then
    SEGMENT_HOSTNAME="${SEGMENT_HOSTNAME}${CODE_BOLD}${hostname_icon_remote}"
  else
    SEGMENT_HOSTNAME="${SEGMENT_HOSTNAME}${hostname_icon_local}"
  fi
  SEGMENT_HOSTNAME="${SEGMENT_HOSTNAME}${ICON_SPACE} "

  SEGMENT_HOSTNAME="${SEGMENT_HOSTNAME}${HOST}${CODE_REGULAR}"
  SEGMENT_HOSTNAME="${SEGMENT_HOSTNAME} "

  local hostname_icon_os

  case "${OS_RELEASE_ID}" in
    "arch"  ) hostname_icon_os="${ICON_ARCH}"   ;;
    "ubuntu") hostname_icon_os="${ICON_UBUNTU}" ;;
    *     )
      if [[ -n "${OS_RELEASE_ID}" ]]; then
        hostname_icon_os="${ICON_PENGUIN_SMALL}"
      fi
      ;;
  esac

  if [[ -n "${hostname_icon_os}" ]]; then
    SEGMENT_HOSTNAME="${SEGMENT_HOSTNAME}${hostname_icon_os}${ICON_SPACE}"
  fi

  ################################ PWD Segment #################################

  local SEGMENT_PWD

  local pwd_color_bg="${COLOR_BLUE}"
  local pwd_color_fg="${COLOR_BLACK}"

  SEGMENT_PWD="${SEGMENT_PWD}${CODE_BACKGROUND}${pwd_color_bg}"
  SEGMENT_PWD="${SEGMENT_PWD}${CODE_FOREGROUND}${hostname_color_bg}"
  SEGMENT_PWD="${SEGMENT_PWD}${GLYPH_DIVIDER_RIGHT_HARD}"
  SEGMENT_PWD="${SEGMENT_PWD}${CODE_FOREGROUND}${pwd_color_fg}"

  local pwd_icon

  # SEE:
  #
  # * file-hierarchy(7)
  # * hier
  # * xdg-user-dir
  case "${PWD}" in
    / ) pwd_icon="${ICON_FOLDER_FRONT}" ;;
    /*)
      case "${PWD#/}/" in
        bin/* ) pwd_icon="${ICON_FOLDER_ARROW}" ;;
        boot/*) pwd_icon="${ICON_POWER}"        ;;
        dev/* )
          case "${PWD#/dev/}/" in
            shm/*) pwd_icon="${ICON_USER_MULTI}" ;;
            *    ) pwd_icon="${ICON_DISK}"       ;;
          esac
          ;;
        efi/*) pwd_icon="${ICON_POWER}" ;;
        etc/*)
          case "${PWD#/etc/}/" in
            skel/*) pwd_icon="${ICON_USER_OUTLINE}" ;;
            opt/* ) pwd_icon="${ICON_PACKAGE}"      ;;
            X11/* ) pwd_icon="${ICON_MONITOR_FILL}" ;;
            xml/* ) pwd_icon="${ICON_FILE_CODE}"    ;;
            *     ) pwd_icon="${ICON_SLIDERS_HORZ}" ;;
          esac
          ;;
        home*)
          case "${PWD#/home/}/" in
            */.cache/*      ) pwd_icon="${ICON_DATA_EMPTY}"   ;;
            */Code/*        ) pwd_icon="${ICON_CODE}"         ;;
            */.config/*     ) pwd_icon="${ICON_SLIDERS_HORZ}" ;;
            */Desktop/*     ) pwd_icon="${ICON_DESKTOP}"      ;;
            */Documents/*   ) pwd_icon="${ICON_BRIEFCASE}"    ;;
            */Downloads/*   ) pwd_icon="${ICON_DOWNLOAD}"     ;;
            */.local/bin/*  ) pwd_icon="${ICON_FILE_BINARY}"  ;;
            */.local/lib/*  ) pwd_icon="${ICON_BOOK}"         ;;
            */.local/share/*) pwd_icon="${ICON_APPLICATION}"  ;;
            */Music/*       ) pwd_icon="${ICON_MUSIC}"        ;;
            */Pictures/*    ) pwd_icon="${ICON_PICTURE}"      ;;
            */Public/*      ) pwd_icon="${ICON_USER_MULTI}"   ;;
            */Templates/*   ) pwd_icon="${ICON_FILE_COPY}"    ;;
            */Videos/*      ) pwd_icon="${ICON_VIDEO}"        ;;
            *               ) pwd_icon="${ICON_HOME}"         ;;
          esac
          ;;
        lib/* ) pwd_icon="${ICON_FOLDER_ARROW}" ;;
        mnt/* ) pwd_icon="${ICON_DISK}"         ;;
        opt/* ) pwd_icon="${ICON_PACKAGE}"      ;;
        proc/*)
          case "${PWD#/proc/}/" in
            sys/*) pwd_icon="${ICON_COG_MULTI}" ;;
            *    ) pwd_icon="${ICON_COG_SINGLE}"      ;;
          esac
          ;;
        root/*) pwd_icon="${ICON_HOME}" ;;
        run/* )
          case "${PWD#/run/}/" in
            user/*) pwd_icon="${ICON_USER_FILL}"        ;;
            lock/*) pwd_icon="${ICON_LOCK_FILL_CLOSED}" ;;
            log/* ) pwd_icon="${ICON_FILE_TEXT}"        ;;
            *     ) pwd_icon="${ICON_LIGHTNING}"        ;;
          esac
          ;;
        sbin/*) pwd_icon="${ICON_FOLDER_ARROW}" ;;
        srv/* ) pwd_icon="${ICON_SERVER}"       ;;
        sys/* ) pwd_icon="${ICON_CHIP}"         ;;
        tmp/* ) pwd_icon="${ICON_BOMB}"         ;;
        usr/* )
          case "${PWD#/usr/}/" in
            bin/*    ) pwd_icon="${ICON_FILE_BINARY}" ;;
            include/*)
              case "${PWD#/usr/include/}/" in
                linux/*) pwd_icon="${ICON_PENGUIN}"      ;;
                X11/*  ) pwd_icon="${ICON_MONITOR_FILL}" ;;
                *      ) pwd_icon="${ICON_FILE_CODE}"    ;;
              esac
              ;;
            lib/*  ) pwd_icon="${ICON_BOOK}" ;;
            local/*)
              case "${PWD#/usr/local/}/" in
                bin/*    ) pwd_icon="${ICON_FILE_BINARY}"  ;;
                doc/*    ) pwd_icon="${ICON_FILE_TEXT}"    ;;
                etc/*    ) pwd_icon="${ICON_SLIDERS_HORZ}" ;;
                games/*  ) pwd_icon="${ICON_CONTROLLER}"   ;;
                include/*) pwd_icon="${ICON_FILE_CODE}"    ;;
                lib/*    ) pwd_icon="${ICON_BOOK}"         ;;
                man/*    ) pwd_icon="${ICON_FILE_TEXT}"    ;;
                sbin/*   ) pwd_icon="${ICON_FILE_BINARY}"  ;;
                share/*  ) pwd_icon="${ICON_APPLICATION}"  ;;
                src/*    ) pwd_icon="${ICON_FILE_CODE}"    ;;
                *        ) pwd_icon="${ICON_TOOLBOX}"      ;;
              esac
              ;;
            sbin/* ) pwd_icon="${ICON_FOLDER_ARROW}" ;;
            share/*)
              case "${PWD#/usr/share/}/" in
                dict/*       ) pwd_icon="${ICON_FILE_TEXT}"     ;;
                doc/*        ) pwd_icon="${ICON_FILE_TEXT}"     ;;
                factory/etc/*) pwd_icon="${ICON_FILE_EMPTY}"    ;;
                factory/var/*) pwd_icon="${ICON_DATA_EMPTY}"    ;;
                info/*       ) pwd_icon="${ICON_I_CIRCLE_FILL}" ;;
                locale/*     ) pwd_icon="${ICON_GLOBE}"         ;;
                man/*        ) pwd_icon="${ICON_FILE_TEXT}"     ;;
                misc/*       ) pwd_icon="${ICON_WRENCH}"        ;;
                terminfo/*   ) pwd_icon="${ICON_PROMPT_FILL}"   ;;
                xml/*        ) pwd_icon="${ICON_FILE_CODE}"     ;;
                zoneinfo/*   ) pwd_icon="${ICON_CLOCK_ALT}"     ;;
                *            ) pwd_icon="${ICON_APPLICATION}"   ;;
              esac
              ;;
            src/*) pwd_icon="${ICON_FILE_CODE}" ;;
            *    ) pwd_icon="${ICON_TRUCK}"     ;;
          esac
          ;;
        var/*)
          case "${PWD#/var/}/" in
            cache/*)
              case "${PWD#/var/cache/}/" in
                man/*) pwd_icon="${ICON_FILE_TEXT}" ;;
                *    ) pwd_icon="${ICON_DATA}"      ;;
              esac
              ;;
            games/*        ) pwd_icon="${ICON_CONTROLLER}"   ;;
            lib/*          ) pwd_icon="${ICON_BOOK}"         ;;
            lock/*         ) pwd_icon="${ICON_FOLDER_ARROW}" ;;
            log/*          ) pwd_icon="${ICON_FILE_TEXT}"    ;;
            mail/*         ) pwd_icon="${ICON_FOLDER_ARROW}" ;;
            opt/*          ) pwd_icon="${ICON_PACKAGE}"      ;;
            run/*          ) pwd_icon="${ICON_FOLDER_ARROW}" ;;
            spool/anacron/*) pwd_icon="${ICON_CLOCK_ALT}"    ;;
            spool/cron/*   ) pwd_icon="${ICON_CLOCK_ALT}"    ;;
            spool/cups/*   ) pwd_icon="${ICON_PRINTER}"      ;;
            spool/mail/*   ) pwd_icon="${ICON_MAIL}"         ;;
            tmp/*          ) pwd_icon="${ICON_BOMB}"         ;;
            *              ) pwd_icon="${ICON_DATA}"         ;;
          esac
          ;;
        *) pwd_icon="${ICON_FOLDER_OPEN}" ;;
      esac
      ;;
  esac

  SEGMENT_PWD="${SEGMENT_PWD} ${pwd_icon}${ICON_SPACE} ${GLYPH_DIVIDER_RIGHT_SOFT}"

  local pwd="${PWD}"
  pwd="${pwd/${HOME}/~}"

  local dirs=("${(s:/:)pwd}")

  if [[ -z "${dirs[1]}" ]]; then
    dirs[1]="/"
  fi

  local dir
  for dir in "${dirs[@]:0:${#dirs[@]}-1}"; do
    SEGMENT_PWD="${SEGMENT_PWD} ${dir} ${GLYPH_DIVIDER_RIGHT_SOFT}"
  done

  SEGMENT_PWD="${SEGMENT_PWD} ${CODE_BOLD}${dirs[-1]}${CODE_REGULAR} "

  ################################ Git Segment #################################

  local SEGMENT_GIT

  local git_color_bg="${COLOR_CYAN}"
  local git_color_fg="${COLOR_BLACK}"

  if type __git_ps1 > /dev/null; then

    local git_separator="|||"

    local git_ps1
    git_ps1="$(GIT_PS1_SHOWUPSTREAM="" \
      GIT_PS1_STATESEPARATOR="${git_separator}" \
      __git_ps1 "%s")"

    if [[ -n "${git_ps1}" ]]; then
      SEGMENT_GIT="${SEGMENT_GIT}${CODE_BACKGROUND}${git_color_bg}"
      SEGMENT_GIT="${SEGMENT_GIT}${CODE_FOREGROUND}${pwd_color_bg}"
      SEGMENT_GIT="${SEGMENT_GIT}${GLYPH_DIVIDER_RIGHT_HARD}"
      SEGMENT_GIT="${SEGMENT_GIT}${CODE_FOREGROUND}${git_color_fg}"

      local git_branch
      git_branch="${git_ps1%${git_separator}*}"

      local git_status
      if [[ "${git_ps1}" == *"${git_separator}"* ]]; then
        git_status="${git_ps1#*${git_separator}}"
      fi
      git_status="${git_status:s/%%/%}"

      if [[ "${git_ps1}" == *"|REBASE"* ]]; then
        local temp="${git_ps1%*"|REBASE"*}"
        if [[ "${temp}" == *"${git_separator}"* ]]; then
          git_status="${temp#*${git_separator}}"
        fi
        git_branch="${git_branch}${git_ps1#*"${temp}"}"
      fi

      if [[ -n "${git_status}" ]]; then
        SEGMENT_GIT="${SEGMENT_GIT}${CODE_BOLD}"
      fi

      local git_remote
      git_remote="$(git remote -v)"

      local git_icon
      case "${git_remote}" in
        *github*) git_icon="${ICON_OCTOCAT_FACE}" ;;
        *gitlab*) git_icon="${ICON_GITLAB}"       ;;
        *       ) git_icon="${ICON_GIT_FILL}"     ;;
      esac

      SEGMENT_GIT="${SEGMENT_GIT} ${git_icon}${ICON_SPACE} "

      SEGMENT_GIT="${SEGMENT_GIT}${git_branch} "

      while [[ -n "${git_status}" ]]; do
        local symbol="${git_status:0:1}"

        case "${symbol}" in
          "*" ) SEGMENT_GIT="${SEGMENT_GIT}${ICON_PENCIL}${ICON_SPACE}"        ;;
          "+" ) SEGMENT_GIT="${SEGMENT_GIT}${ICON_CHECKMARK}${ICON_SPACE}"     ;;
          "\$") SEGMENT_GIT="${SEGMENT_GIT}${ICON_FLAG}${ICON_SPACE}"          ;;
          "%" ) SEGMENT_GIT="${SEGMENT_GIT}${ICON_QUESTION_MARK}${ICON_SPACE}" ;;
        esac

        git_status="${git_status:1:${#git_status}}"
      done

      SEGMENT_GIT="${SEGMENT_GIT}${CODE_REGULAR}"
    fi
  fi

  ############################ Pipe Status Segment #############################

  local SEGMENT_EXIT

  local exit_color_bg_prev
  local exit_color_fail="${COLOR_RED}"
  local exit_color_fg="${COLOR_BLACK}"
  local exit_color_success="${COLOR_GREEN}"

  local exit_fail
  local stat
  for stat in $_PIPESTATUS; do
    if [[ "${stat}" -ne "0" ]]; then
      exit_fail="true"
    fi
  done

  if [[ -n "${exit_fail}" ]]; then
    local status_color_bg
    if [[ "${_PIPESTATUS[1]}" -eq "0" ]]; then
      status_color_bg="${exit_color_success}"
    else
      status_color_bg="${exit_color_fail}"
    fi

    local status_color_fg
    if [[ -n "${SEGMENT_GIT}" ]]; then
      status_color_fg="${git_color_bg}"
    else
      status_color_fg="${pwd_color_bg}"
    fi

    SEGMENT_EXIT="${SEGMENT_EXIT}${CODE_BACKGROUND}${status_color_bg}"
    SEGMENT_EXIT="${SEGMENT_EXIT}${CODE_FOREGROUND}${status_color_fg}"
    SEGMENT_EXIT="${SEGMENT_EXIT}${GLYPH_DIVIDER_RIGHT_HARD}"
    SEGMENT_EXIT="${SEGMENT_EXIT}${CODE_FOREGROUND}${exit_color_fg}"

    for stat in $_PIPESTATUS; do
      if [[ "${stat}" -eq "0" ]]; then
        status_color_bg="${exit_color_success}"
      else
        status_color_bg="${exit_color_fail}"
      fi

      if [[ -n "${exit_color_bg_prev}" ]]; then
        if [[ "${exit_color_bg_prev}" == "${status_color_bg}" ]]; then
          SEGMENT_EXIT="${SEGMENT_EXIT}${GLYPH_DIVIDER_RIGHT_SOFT}"
        else
          SEGMENT_EXIT="${SEGMENT_EXIT}${CODE_BACKGROUND}${status_color_bg}"
          SEGMENT_EXIT="${SEGMENT_EXIT}${CODE_FOREGROUND}${exit_color_bg_prev}"
          SEGMENT_EXIT="${SEGMENT_EXIT}${GLYPH_DIVIDER_RIGHT_HARD}"
          SEGMENT_EXIT="${SEGMENT_EXIT}${CODE_FOREGROUND}${exit_color_fg}"
        fi
      fi
      exit_color_bg_prev="${status_color_bg}"

      SEGMENT_EXIT="${SEGMENT_EXIT}${CODE_BACKGROUND}${status_color_bg}"
      SEGMENT_EXIT="${SEGMENT_EXIT} "
      SEGMENT_EXIT="${SEGMENT_EXIT}${CODE_BOLD}${stat}"
      SEGMENT_EXIT="${SEGMENT_EXIT}${CODE_REGULAR} "
    done
  fi

  ################################ Last Segment ################################

  local SEGMENT_LAST

  SEGMENT_LAST="${CODE_RESET}${CODE_FOREGROUND}"

  if [[ -n "${SEGMENT_EXIT}" ]]; then
    SEGMENT_LAST="${SEGMENT_LAST}${exit_color_bg_prev}"
  elif [[ -n "${SEGMENT_GIT}" ]]; then
    SEGMENT_LAST="${SEGMENT_LAST}${git_color_bg}"
  else
    SEGMENT_LAST="${SEGMENT_LAST}${pwd_color_bg}"
  fi

  SEGMENT_LAST="${SEGMENT_LAST}${GLYPH_DIVIDER_RIGHT_HARD}${CODE_RESET}"

  ################################ All Segments ################################

  local SEGMENT_ALL

  SEGMENT_ALL="${SEGMENT_ALL}${SEGMENT_MODE}${SEGMENT_DATE}${SEGMENT_USER}"
  SEGMENT_ALL="${SEGMENT_ALL}${SEGMENT_HOSTNAME}${SEGMENT_PWD}${SEGMENT_GIT}"
  SEGMENT_ALL="${SEGMENT_ALL}${SEGMENT_EXIT}${SEGMENT_LAST}"

  declare -g __PS1_CACHE="${SEGMENT_ALL}"
}
