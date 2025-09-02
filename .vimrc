syntax enable
set relativenumber
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

