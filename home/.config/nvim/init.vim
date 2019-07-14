" neovim - hyperextensible Vim-based text editor
" https://neovim.io
" https://github.com/neovim/neovim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" onedark.vim

" Global color overrides
"
" You can override colors across all highlights by adding color definitions to
" the g:onedark_color_overrides dictionary.
"
" This needs to be done before colorscheme onedark.
"
" More examples of highlight group names and style data can be found in
" onedark.vim's source code (colors/onedark.vim).
let g:onedark_color_overrides = {
  \ "comment_grey": { "gui": "#7f848e", "cterm": "59", "cterm16": "15" },
  \ "special_grey": { "gui": "#5C6370", "cterm": "238", "cterm16": "15" }
\ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-airline

" Automatically displays all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled=1

" By default, airline will use unicode symbols if your encoding matches utf-8.
" If you want the powerline symbols set this variable.
let g:airline_powerline_fonts=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if filereadable(expand('~/.local/share/nvim/site/autoload/plug.vim'))
  call plug#begin('~/.local/share/nvim/plugged')

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " onedark.vim
  "   A dark Vim/Neovim color scheme inspired by Atom's One Dark syntax theme
  "
  " https://github.com/joshdick/onedark.vim

  Plug 'joshdick/onedark.vim'

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " vim-airline
  "   lean & mean status/tabline for vim that's light as air
  "
  " https://github.com/vim-airline/vim-airline

  Plug 'vim-airline/vim-airline'

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " vim-polyglot
  "   A solid language pack for Vim
  "
  " https://github.com/sheerun/vim-polyglot

  Plug 'sheerun/vim-polyglot'

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  call plug#end()
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" :colo[rscheme] {name}
"
" Load color scheme {name}.  This searches 'runtimepath' for the file
" "colors/{name}.vim".  The first one that is found is loaded.
" Also searches all plugins in 'packpath', first below "start" and then under
" "opt".
"
" Doesn't work recursively, thus you can't use ":colorscheme" in a color scheme
" script.
"
" To customize a colorscheme use another name, e.g. "~/.vim/colors/mine.vim",
" and use `:runtime` to load the original colorscheme:
"   runtime colors/evening.vim
"   hi Statement ctermfg=Blue guifg=Blue

" Before the color scheme will be loaded the |ColorSchemePre| autocommand event
" is triggered.  After the color scheme has been loaded the |ColorScheme|
" autocommand event is triggered.  For info about writing a colorscheme file:
"   :edit $VIMRUNTIME/colors/README.txt

colorscheme onedark

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" *:syn-on* *:syntax-on*
"
" The `:syntax enable` command will keep your current color settings.  This
" allows using `:highlight` commands to set your preferred colors before or
" after using this command.  If you want Vim to overrule your settings with the
" defaults, use:
"   :syntax on

syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 'colorcolumn' 'cc'
"   string  (default "")
"   local to window
"
" 'colorcolumn' is a comma separated list of screen columns that are highlighted
" with ColorColumn hl-ColorColumn.  Useful to align text.  Will make screen
" redrawing slower.
" The screen column can be an absolute number, or a number preceded with '+' or
" '-', which is added to or subtracted from 'textwidth'.
"
"   :set cc=+1  " highlight column after 'textwidth'
"   :set cc=+1,+2,+3  " highlight three columns after 'textwidth'
"   :hi ColorColumn ctermbg=lightgrey guibg=lightgrey
"
" When 'textwidth' is zero then the items with '-' and '+' are not used.  A
" maximum of 256 columns are highlighted.

set colorcolumn=81

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 'expandtab' 'et'
"   boolean (default off)
"   local to buffer
"
" In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
" Spaces are used in indents with the '>' and '<' commands and when 'autoindent'
" is on.  To insert a real tab when 'expandtab' is on, use CTRL-V<Tab>.  See
" also :retab and ins-expandtab.
" This option is reset when the 'paste' option is set and restored when the
" 'paste' option is reset.

set expandtab

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 'ignorecase' 'ic'
"   boolean (default off)
"   global
"
" Ignore case in search patterns.  Also used when searching in the tags file.
" Also see 'smartcase' and 'tagcase'.
" Can be overruled by using "\c" or "\C" in the pattern, see /ignorecase.

set ignorecase

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 'list'
"   boolean (default off)
"   local to windowa
"
" List mode: Show tabs as CTRL-I is displayed, display $ after end of line.
" Useful to see the difference between tabs and spaces and for trailing blanks.
" Further changed by the 'listchars' option.
"
" The cursor is displayed at the start of the space a Tab character occupies,
" not at the end as usual in Normal mode.  To get this cursor position while
" displaying Tabs with spaces, use:
"   :set list lcs=tab:\ \
"
" Note that list mode will also affect formatting (set with 'textwidth' or
" 'wrapmargin') when 'cpoptions' includes 'L'.  See 'listchars' for changing the
" way tabs are displayed.

set list

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" listchars' 'lcs'
"   string  (default: "tab:> ,trail:-,nbsp:+"
"     Vi default: "eol:$")
"   global
"
" Strings to use in 'list' mode and for the :list command.  It is a comma
" separated list of string settings.
"
" eol:c
"   Character to show at the end of each line.  When omitted, there is no extra
"   character at the end of the line.
"
" tab:xy
"   Two characters to be used to show a tab.  The first char is used once.  The
"   second char is repeated to fill the space that the tab normally occupies.
"   "tab:>-" will show a tab that takes four spaces as ">---".  When omitted, a
"   tab is show as ^I.
"
" space:c
"   Character to show for a space.  When omitted, spaces are left blank.
"
" trail:c
"   Character to show for trailing spaces.  When omitted, trailing spaces are
"   blank.  Overrides the "space" setting for trailing spaces.
"
" extends:c
"   Character to show in the last column, when 'wrap' is off and the line
"   continues beyond the right of the screen.
"
" precedes:c
"   Character to show in the first column, when 'wrap' is off and there is text
"   preceding the character visible in the first column.
"
" conceal:c
"   Character to show in place of concealed text, when 'conceallevel' is set to
"   1.  A space when omitted.
"
" nbsp:c
"   Character to show for a non-breakable space character (0xA0 (160 decimal)
"   and U+202F).  Left blank when omitted.
"
" The characters ':' and ',' should not be used.  UTF-8 characters can be used.
" All characters must be single width.
"
" Examples:
"   :set lcs=tab:>-,trail:-
"   :set lcs=tab:>-,eol:<,nbsp:%
"   :set lcs=extends:>,precedes:<
" hl-NonText highlighting will be used for "eol", "extends" and "precedes".
" hl-Whitespace for "nbsp", "space", "tab" and "trail".

set listchars=eol:¬,tab:»-,trail:~,extends:>,precedes:<,space:·

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 'smartcase' 'scs'
"   boolean (default off)
"   global
"
" Override the 'ignorecase' option if the search pattern contains upper case
" characters.  Only used when the search pattern is typed and 'ignorecase'
" option is on.  Used for the commands "/", "?", "n", "N", ":g" and ":s".  Not
" used for "*", "#", "gd", tag search, etc.  After "*" and "#" you can make
" 'smartcase' used by doing a "/" command, recalling the search pattern from
" history and hitting <Enter>.

set smartcase

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 'softtabstop' 'sts'
"   number  (default 0)
"   local to buffer
"
" Number of spaces that a <Tab> counts for while performing editing operations,
" like inserting a <Tab> or using <BS>.  It "feels" like <Tab>s are being
" inserted, while in fact a mix of spaces and <Tab>s is used.  This is useful to
" keep the 'ts' setting at its standard value of 8, while being able to edit
" like it is set to 'sts'.  However, commands like "x" still work on the actual
" characters.
" When 'sts' is zero, this feature is off.
" When 'sts' is negative, the value of 'shiftwidth' is used.
" 'softtabstop' is set to 0 when the 'paste' option is set and restored when
" 'paste' is reset.
" See also ins-expandtab.  When 'expandtab' is not set, the number of spaces is
" minimized by using <Tab>s.
" The 'L' flag in 'cpoptions' changes how tabs are used when 'list' is set.

set softtabstop=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 'tabstop' 'ts'
"   number  (default 8)
"   local to buffer
"
" Number of spaces that a <Tab> in the file counts for.  Also see :retab
" command, and 'softtabstop' option.
"
" Note: Setting 'tabstop' to any other value than 8 can make your file appear
" wrong in many places (e.g., when printing it).
"
" There are four main ways to use tabs in Vim:
" 1. Always keep 'tabstop' at 8, set 'softtabstop' and 'shiftwidth' to 4 (or 3
"    or whatever you prefer) and use 'noexpandtab'.  Then Vim will use a mix of
"    tabs and spaces, but typing <Tab> and <BS> will behave like a tab appears
"    every 4 (or 3) characters.
" 2. Set 'tabstop' and 'shiftwidth' to whatever you prefer and use 'expandtab'.
"    This way you will always insert spaces.  The formatting will never be
"    messed up when 'tabstop' is changed.
" 3. Set 'tabstop' and 'shiftwidth' to whatever you prefer and use a modeline to
"    set these values when editing the file again.  Only works when using Vim to
"    edit the file.
" 4. Always set 'tabstop' and 'shiftwidth' to the same value, and 'noexpandtab'.
"    This should then work (for initial indents only) for any tabstop setting
"    that people use.  It might be nice to have tabs after the first non-blank
"    inserted as spaces if you do this though.  Otherwise aligned comments will
"    be wrong when 'tabstop' is changed.

set tabstop=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 'termguicolors' 'tgc'
"   boolean (default off)
"   global
"
" When on, uses highlight-guifg and highlight-guibg attributes in the terminal
" (thus using 24-bit color). Requires a ISO-8613-3 compatible terminal.

set termguicolors

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""