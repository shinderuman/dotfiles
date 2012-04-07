syntax enable
colorscheme elflord

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin on
 
Bundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup=1 "vim立ち上げ時に自動的にvim-indent-guidesをオンにする
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
