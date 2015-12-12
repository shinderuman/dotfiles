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
    autocmd VimEnter,WinEnter * match WhiteSpaceEOL /\s\+$/
    autocmd VimEnter,WinEnter * 2match ZenkakuSpace /　/
    autocmd VimEnter,WinEnter * 3match Tab /\t/
  augroup END
  call VimColors()
endif

"==================== neobundle
set nocompatible
filetype off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#begin(expand('~/.vim/bundle/'))
	NeoBundleFetch 'Shougo/neobundle.vim'
	" ここにインストールしたいプラグインのリストを書く
	NeoBundle 'Shougo/unite.vim.git'
	NeoBundle 'mattn/gist-vim.git'
	NeoBundle 'mattn/webapi-vim.git'
	NeoBundle 'koron/nyancat-vim.git'
	NeoBundle 'mattn/habatobi-vim.git'
	NeoBundle 'mattn/hahhah-vim.git'
	NeoBundle 'mattn/vim-airline-hahhah.git'
	NeoBundle 'mattn/multi-vim'
	NeoBundle 'mattn/ctrlp-hotentry'
	NeoBundle 'vim-scripts/TwitVim'
	NeoBundle 'mattn/ctrlp-google'
	NeoBundle 'mattn/vim-metarw-etcd'
	NeoBundle 'mattn/sonictemplate-vim'
	NeoBundle 'rbtnn/game_engine.vim'
	NeoBundle 'rbtnn/pipe.vim'
	NeoBundle 'rbtnn/puyo.vim'
	NeoBundle 'rbtnn/mario.vim'
	NeoBundle 'rbtnn/reverse.vim'

	call neobundle#end()
endif

"go lang
set rtp+=$GOROOT/libexec/misc/vim
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
set completeopt=menu,preview

filetype plugin on
filetype indent on



let g:indent_guides_auto_colors = 0 "autoにするとよく見えなかったので自動的に色付けするのはストップ
let g:indent_guides_color_change_percent = 10 "色の変化の幅（？）。パーセンテージらしい
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=black guibg=black ctermbg=1 "インデントの色
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey guibg=darkgrey ctermbg=2 "二段階目のインデントの色
let g:indent_guides_guide_size = 1 "インデントの色付け幅

autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=2 expandtab shiftwidth=2 softtabstop=2

" Execute python script C-P
function! s:ExecPy()
    exe "!" . &ft . " %"
:endfunction
command! Exec call <SID>ExecPy()
autocmd FileType python map <silent> <C-P> :call <SID>ExecPy()<CR>
autocmd FileType python let g:pydiction_location = '~/.vim/pydiction/complete-dict'

set backspace=indent,eol,start

set foldlevel=100 "Don't autofold anything

"set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
