vim.cmd([[

" pre reqest
set nocompatible
filetype plugin on
syntax on

"syntax

let g:vimwiki_global_ext = 0



]])
vim.g.vimwiki_list = {
    {
        path = '~/Documents/vimwiki/',
        syntax = 'markdown',
        ext = '.md',
    }
}
