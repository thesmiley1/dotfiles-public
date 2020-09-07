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

setlocal colorcolumn=51,73
