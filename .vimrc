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
	    call neobundle#rc(expand('~/.vim/bundle'))
endif

" ここにインストールしたいプラグインのリストを書く
NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'mattn/gist-vim.git'
NeoBundle 'mattn/webapi-vim.git'
NeoBundle 'koron/nyancat-vim.git'
NeoBundle 'mattn/habatobi-vim.git'
"NeoBundle 'mattn/hahhah-vim.git'
"NeoBundle 'mattn/vim-airline-hahhah.git'
NeoBundle 'mattn/multi-vim'
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

"encofing auto judge
if &encoding !=# 'utf-8'
    set encoding=japan
    set fileencoding=japan
endif
if has('iconv')
    let s:enc_euc = 'euc-jp'
    let s:enc_jis = 'iso-2022-jp'
    if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
        let s:enc_euc = 'eucjp-ms'
        let s:enc_jis = 'iso-2022-jp-3'
    elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
        let s:enc_euc = 'euc-jisx0213'
        let s:enc_jis = 'iso-2022-jp-3'
    endif
    if &encoding ==# 'utf-8'
        let s:fileencodings_default = &fileencodings
        let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
        let &fileencodings = &fileencodings .','. s:fileencodings_default
        unlet s:fileencodings_default
    else
        let &fileencodings = &fileencodings .','. s:enc_jis
        set fileencodings+=utf-8,ucs-2le,ucs-2
        if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
            set fileencodings+=cp932
            set fileencodings-=euc-jp
            set fileencodings-=euc-jisx0213
            set fileencodings-=eucjp-ms
            let &encoding = s:enc_euc
            let &fileencoding = s:enc_euc
        else
            let &fileencodings = &fileencodings .','. s:enc_euc
        endif
    endif
    unlet s:enc_euc
    unlet s:enc_jis
endif

set backspace=indent,eol,start

set foldlevel=100 "Don't autofold anything

"set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

