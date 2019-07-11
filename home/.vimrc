" vim - Vi IMproved, a programmer's text editor

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" load a specific color scheme
colorscheme default

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Filetypes
"   Vim can detect the type of file that is edited.  This is done by checking
"   the file name and sometimes by inspecting the contents of the file for
"   specific text.
"
"   command                         detection       plugin          indent
"   :filetype plugin indent on      on              on              on
"
" :filetype on
"   Enable file type detection
"
"   Each time a new or existing file is edited, Vim will try to recognize the
"   type of the file and set the 'filetype' option.  This will trigger the
"   FileType event, which can be used to set the syntax highlighting, set
"   options, etc.
"
" "filetype plugin on
"   Enable loading the plugin files for specific file types.
"
"   If filetype detection was not switched on yet, it will be as well.  This
"   actually loads the file "ftplugin.vim" in 'runtimepath'.  The result is that
"   when a file is edited its plugin file is loaded (if there is one for
"   the detected filetype).
"
" :filetype indent on
"   Enable loading the indent file for specific file types.
"
"   If filetype detection was not switched on yet, it will be as well.  This
"   actually loads the file "indent.vim" in 'runtimepath'.  The result is that
"   when a file is edited its indent file is loaded (if there is one for the
"   detected filetype).

filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" expandtab (et) | noexpandtab (noet)
"   boolean (default off)
"   local to buffer
"
"   In Insert mode:  Use the appropriate number of spaces to insert a <Tab>.
"   Spaces are used in indents with the '>' and '<' commands and when
"   'autoindent' is on.  To insert a real tab when 'expandtab' is on, use
"   CTRL-V<Tab>.
"
"   See also |:retab| and |ins-expandtab|.
"
"   This option is reset when the `paste` option is set and restored when the
"   `paste` option is reset.
"
"   NOTE: This option is reset when `compatible` is set.

set expandtab

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" list | nolist
"   boolean (default off)
"   local to window
"
"   List mode: Show tabs as CTRL-I is displayed, display $ after end of line.
"   Useful to see the difference between tabs and spaces and for trailing
"   blanks.  Further changed by the `listchars` option.
"
"   The cursor is displayed at the start of the space a Tab character occupies,
"   not at the end as usual in Normal mode.  To get this cursor position while
"   displaying Tabs with spaces, use: `:set list lcs=tab:\ \`.

"   Note that list mode will also affect formatting (set with 'textwidth' or
"   'wrapmargin') when 'cpoptions' includes 'L'.  See 'listchars' for changing
"   the way tabs are displayed.

set list

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" listchars (lcs)
"   string  (default "eol:$")
"   global
"
"   Strings to use in 'list' mode and for the |:list| command.  It is a comma
"   separated list of string settings.
"
"   eol:c
"     Character to show at the end of each line.  When omitted, there is no
"     extra character at the end of the line.
"
"   tab:xy[z]
"     Two or three characters to be used to show a tab.  The third character is
"     optional.
"
"   tab:xy
"     The `x` is always used, then `y` as many times as will fit.  Thus `tab:>`-
"     displays:  `>`, `>-`, `>--`, etc.
"
"   tab:xyz
"     The `z` is always used, then `x` is prepended, and then `y` is used as
"     many times as will fit.  Thus `tab:<->` displays:  `>`, `<>`, `<->`,
"     `<-->`, etc.
"
"   When `tab:` is omitted, a tab is shown as ^I.
"
"   space:c
"     Character to show for a space.  When omitted, spaces are left blank.
"
"   trail:c
"     Character to show for trailing spaces.  When omitted, trailing spaces are
"     blank.  Overrides the `space` setting for trailing spaces.
"
"   extends:c
"     Character to show in the last column, when `wrap` is off and the line
"     continues beyond the right of the screen.
"
"   precedes:c
"     Character to show in the first column, when `wrap` is off and there is
"     text preceding the character visible in the first column.
"
"   conceal:c
"     Character to show in place of concealed text, when `conceallevel` is set
"     to 1.
"
"   nbsp:c
"     Character to show for a non-breakable space character (0xA0 (160 decimal)
"     and U+202F).  Left blank when omitted.

"   The characters `:` and `,` should not be used.  UTF-8 characters can be used
"   when `encoding` is `utf-8`, otherwise only printable characters are allowed.
"   All characters must be single width.

set listchars=eol:¬,tab:»-,trail:~,extends:>,precedes:<,space:·

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" number (nu)
"   boolean (default off)
"   local to window
"
"   Print the line number in front of each line.  When the `n` option is
"   excluded from `cpoptions` a wrapped line will not use the column of line
"   numbers (this is the default when `compatible` isn't set).  The
"   `numberwidth` option can be used to set the room used for the line number.
"
"   * When a long, wrapped line doesn't start with the first character, `-`
"     characters are put before the number.

set number

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" softtabstop (sts)
"   number  (default 0)
"   local to buffer
"
"   Number of spaces that a <Tab> counts for while performing editing
"   operations, like inserting a <Tab> or using <BS>.  It "feels" like <Tab>s
"   are being inserted, while in fact a mix of spaces and <Tab>s is used.  This
"   is useful to keep the `ts` setting at its standard value of 8, while being
"   able to edit like it is set to `sts`.  However, commands like "x" still work
"   on the actual characters.
"
"   * When `sts` is zero, this feature is off.
"   * When `sts` is negative, the value of `shiftwidth` is used.
"   * `softtabstop` is set to 0 when the `paste` option is set and restored when
"     `paste` is reset.
"
"   See also |ins-expandtab|.
"
"   * When `expandtab` is not set, the number of spaces is minimized by using
"     <Tab>s.
"   * The `L` flag in `cpoptions` changes how tabs are used when `list` is set.
"
"   NOTE: This option is set to 0 when 'compatible' is set.
"
"   If Vim is compiled with the |+vartabs| feature then the value of
"   `softtabstop` will be ignored if `varsofttabstop` is set to anything other
"   than an empty string.

set softtabstop=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" tabstop (ts)
"   number  (default 8)
"   local to buffer
"
"   Number of spaces that a <Tab> in the file counts for.  Also see
"   :retab command, and 'softtabstop' option.
"
"   Note: Setting 'tabstop' to any other value than 8 can make your file appear
"   wrong in many places (e.g., when printing it).
"
"   There are four main ways to use tabs in Vim:
"   1. Always keep 'tabstop' at 8, set 'softtabstop' and 'shiftwidth' to 4 (or 3
"      or whatever you prefer) and use 'noexpandtab'.  Then Vim will use a mix
"      of tabs and spaces, but typing <Tab> and <BS> will behave like a tab
"      appears every 4 (or 3) characters.
"   2. Set 'tabstop' and 'shiftwidth' to whatever you prefer and use
"      'expandtab'.  This way you will always insert spaces.  The formatting
"      will never be messed up when 'tabstop' is changed.
"   3. Set 'tabstop' and 'shiftwidth' to whatever you prefer and use a modeline
"      to set these values when editing the file again.  Only works when using
"      Vim to edit the file.
"   4. Always set 'tabstop' and 'shiftwidth' to the same value, and
"      'noexpandtab'.  This should then work (for initial indents only) for any
"      tabstop setting that people use.  It might be nice to have tabs after the
"      first non-blank inserted as spaces if you do this though.  Otherwise
"      aligned comments will be wrong when 'tabstop' is changed.
"
"   If Vim is compiled with the +vartabs feature then the value of 'tabstop'
"   will be ignored if 'vartabstop' is set to anything other than an empty
"   string.

set tabstop=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" syntax

" Vim will automagically detect the type of file and load the right syntax
" highlighting.

syntax enable

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" highlight non-text characters light gray

highlight NonText ctermfg=7

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" highlight special keys light gray

highlight SpecialKey ctermfg=7

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
