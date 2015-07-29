runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()


" General
" =======

filetype plugin indent on       " file type detection; language-dependent indenting.
syntax on
syntax enable

let mapleader='\'               " default Leader char
set relativenumber              " Show line numbers relative to current line
set number                      " Show line numbers
set encoding=utf-8
set backspace=indent,eol,start  " Allow backspace in insert mode
set whichwrap+=<,>,h,l          " wrap lines for backspace etc.
set history=1000                " Store lots of :cmdline history
set showcmd                     " Show incomplete cmds down the bottom
set gcr=a:blinkon0              " Disable cursor blink
set autoread                    " Reload files changed outside vim
set laststatus=2                " Always show status line
set hidden                      " Buffers can exist in the background
set splitright                  " Opens vertical split right of current
set splitbelow                  " Opens horizontal split below current
set ignorecase                  " Ignore case when searching
set hlsearch                    " Highlight search results
set incsearch                   " Incremental, start searching immediately
set cindent                     " c style indentation
set smarttab
set nowrap
set list
set listchars=tab:\|\ ,trail:•,eol:¬   " set up whitespace characters
set tabstop=4                   " 4 ch tabs
set shiftwidth=4                " indent 3 ch on tab

set swapfile
set dir=~/tmp                   " change where .swp files go

let loaded_matchparen = 1       " don't highlight matching parens

" Custom Keys
" ===========

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" toggle file browser
nmap <leader>\ :NERDTreeToggle<cr>

" toggle spell check
map <leader>ss :setlocal spell!<cr>

" toggle absolute / relative line numbers
nmap <leader>r :set relativenumber!<cr>

" Buffer Nav
map <leader>f :CtrlP<cr>
map <leader>. :CtrlPTag<cr>
map <leader>w :BufExplorer<cr>
map <leader>] :bnext<cr>
map <leader>[ :bprevious<cr>

" \q to open notes
map <leader>q :e ~/Dropbox/unsorted/notes.md<cr>


" Settings
" ========

au BufReadPost *.zsh-theme set syntax=sh

set colorcolumn=80,120
set cursorline

let g:airline#extensions#tabline#enabled = 1       " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t'   " Show just the filename
let g:airline_powerline_fonts = 1                  " enable special fonts

let g:vim_markdown_folding_disabled=1


" Go
" ==

au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
"au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <leader>j :GoDef<cr>


let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" PHP
" ===

"g:php_syntax_extensions_enabled
"b:php_syntax_extensions_enabled

let g:phpcomplete_index_composer_command="/usr/local/bin/composer"
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

function! PhpSyntaxOverride()
	hi! def link phpDocTags  phpDefine
	hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
	autocmd!
	autocmd FileType php call PhpSyntaxOverride()
augroup END

" NerdTree
" ========

let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.o$']
let NERDTreeWinSize = 35


" Colors
" ======
set t_Co=256
colorscheme molokai
"let g:solarized_termcolors=256
"let g:solarized_visibility="low"
"let g:solarized_contrast="high"
"colorscheme solarized
set background=dark
