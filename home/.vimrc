" use default color scheme
colorscheme default

" turn on filetype detection and load filetype-specific indent files
filetype indent on

" tabs are spaces
set expandtab

" show whitespace characters
set list

" set whitespace characters
set listchars=eol:¬,tab:»-,trail:~,extends:>,precedes:<,space:·

" show line numbers
set number

" number of spaces in tab when editing
set softtabstop=2

" number of visual spaces per tab
set tabstop=2

" enable syntax processing
syntax enable

" highlight·non-text·characters·light·gray
highlight NonText ctermfg=7

" highlight·special·keys·light·gray
highlight SpecialKey ctermfg=7
