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

"==================== neobundle
set nocompatible
filetype off

if has('vim_starting')
	" curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh|sh
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#begin(expand('~/.vim/bundle/'))
	NeoBundleFetch 'Shougo/neobundle.vim'
	" ここにインストールしたいプラグインのリストを書く
	NeoBundle 'twitvim/twitvim'
	NeoBundle 'Shougo/unite.vim.git'
	NeoBundle 'mattn/webapi-vim.git'
	NeoBundle 'mattn/gist-vim.git'
	NeoBundle 'koron/nyancat-vim.git'
	NeoBundle 'mattn/multi-vim'
	NeoBundle 'mattn/ctrlp-hotentry'
	NeoBundle 'mattn/ctrlp-google'
	NeoBundle 'mattn/vim-metarw-etcd'
	NeoBundle 'mattn/sonictemplate-vim'
	NeoBundle 'mattn/vim-yomikata'
	NeoBundle 'fatih/vim-go'

	call neobundle#end()
endif

filetype plugin on
filetype indent on

set backspace=indent,eol,start
"set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
