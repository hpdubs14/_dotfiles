" set at launch to configure external tools exactly once
execute pathogen#infect()
set nocompatible

" Use ack instead of grep
set grepprg=ack
set backspace=indent,eol,start
" set colon to semi-colon for commands speed
nnoremap ; :
" Colors {{{
syntax on
colorscheme badwolf
syntax enable           "enable syntax processing
" }}}
" Spaces & Tables {{{
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab           " Use spaces instead of tabs
set smarttab            " Be smart when using tabs ;)
filetype indent on      "load filetype=specific indent files
filetype plugin on 
set autoindent
"}}}
" UI Layout {{{
set number
set showcmd
set cursorline
set wildmenu
set lazyredraw
set showmatch " highlight matching [{()}]
" }}}
" Searching  {{{
set incsearch " search as characters are entered
set hlsearch " highlight matches

" clears out the highlight serach , space
nnoremap <leader><space> :noh<CR>    
" }}}
" Folding {{{
set foldenable          " enable folding
set foldmethod=indent   " fold based on indent level
set foldlevelstart=10   " opens most folds by default
set foldnestmax=10      " 10 nested fold max
nnoremap <space> za
set modelines=1 " allows for last line to set vim mode
" }}}
" Line Shortcuts {{{
" move to beginning/end of line
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>
" highlight last inserted text
nnoremap gV `[v`]       
" }}}
" Leader Shortcuts {{{
" change the escape remap
let mapleader=","       " leader is a comma instead of default 
inoremap kj <esc>

nnoremap <leader>s :mksession<CR>       
nnoremap <leader>ev :vsp $MYVIMRC<CR>   
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv $MYVIMRC<CR>
nnoremap <leader>l :call ToggleNumber()<CR>
" }}}
" Backups {{{
" set backup dir
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}
" Custom Functions {{{
" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
     else
        set relativenumber
     endif
endfunc

function! <SID>StripTrailingWhitespaces()
    " save last serach & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
" }}}
" vim:foldmethod=marker:foldlevel=0
