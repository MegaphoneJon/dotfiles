" Following lines added by drush vimrc-install on Mon, 19 Jan 2015 03:27:04 +0000.
set nocompatible
call pathogen#infect('/home/jon/.drush/vimrc/bundle/{}')
call pathogen#infect('/home/jon/.vim/bundle/{}')
filetype plugin on
" End of vimrc-install additions.
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set softtabstop=2
if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
    autocmd BufRead,BufNewFile *.inc set filetype=php
    autocmd BufRead,BufNewFile *.profile set filetype=php
    autocmd BufRead,BufNewFile *.view set filetype=php
  augroup END
endif
syntax on
set number
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
let mapleader=","       " leader is comma
" jk is escape
inoremap jk <esc>
