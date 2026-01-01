augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=v-c-sm:block,n-i-ci-ve:ver25,r-cr-o:hor20
augroup END

set number
set mouse=a

set expandtab
set tabstop=4
set shiftwidth=4


" https://vi.stackexchange.com/questions/45122/why-is-my-terminal-background-color-changing-now-when-i-start-neovim-0-10
highlight Normal guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE



