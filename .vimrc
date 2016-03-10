syntax enable
set number
set ruler
colorscheme darkblue

function! VimColors()
  highlight WhiteSpaceEOL ctermbg=red guibg=red
  highlight ZenkakuSpace ctermbg=green guibg=green
  highlight Tab ctermbg=blue guibg=blue
endfunction

if has('syntax')
  augroup VimColors
    autocmd!
    autocmd VimEnter,WinEnter * let w:m1 = matchadd('WhiteSpaceEOL', '\s\+$')
    autocmd VimEnter,WinEnter * let w:m2 = matchadd('ZenkakuSpace', '　')
    autocmd VimEnter,WinEnter * let w:m3 = matchadd('Tab', '\t')
  augroup END
  call VimColors()
endif

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('.vim/dein'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('twitvim/twitvim')
call dein#add('Shougo/unite.vim.git')
call dein#add('mattn/webapi-vim.git')
call dein#add('mattn/gist-vim.git')
call dein#add('koron/nyancat-vim.git')
call dein#add('mattn/multi-vim')
call dein#add('mattn/ctrlp-hotentry')
call dein#add('mattn/ctrlp-google')
call dein#add('mattn/vim-metarw-etcd')
call dein#add('mattn/sonictemplate-vim')
call dein#add('mattn/vim-yomikata')
call dein#add('fatih/vim-go')
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')

" You can specify revision/branch/tag.
" call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

set backspace=indent,eol,start
"set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
