vim.cmd [[






let g:header = [
\ '                                 ,',
\ '                              ,   ,`|',
\ '                            ,/|.-`   \.',
\ '                         .-`  `       |.',
\ '                   ,  .-`              |',
\ '                  /|,`                 |`',
\ '                 / `                    |  ,',
\ '                /                       ,`/',
\ '             .  |          _              /',
\ '              \`` .-.    ,` `.           |',
\ '               \ /   \ /      \          /',
\ '                \|    V        |        |  ,',
\ '                 (           ) /.--.   ``"/',
\ '                 "b.`. ,` _.ee`` 6)|   ,-`',
\ '                   \"= --""  )   ` /.-`',
\ '                    \ / `---"   ."|`',
\ '                     \"..-    .`  |.',
\ '                      `-__..-`,`   |',
\ '                   __.) ` .-`/    /\._',
\ '              _.--`/----..--------. _.-""-._',
\ '           .-`_)   \.   /     __..-`     _.-`--.',
\ '          / -`/      """""""""         ,`-.   . `.',
\ '         | ` /                        /    `   `. \',
\ '         |   |                        |         | |',
\ '          \ . \                       |     \     |',
\ '         / `  | ,`               . -  \`.    |  / /',
\ '        / /   | |                      `/"--. -  /\',
\ '       | |     \ \                     /     \     |',
\ '       | \      | \                  .-|      |    |'
\ ]
function! s:center(lines) abort
    let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
    let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
    return centered_lines
endfunction

let g:startify_custom_header = 'startify#pad(g:vegeta + startify#fortune#boxed())'

let g:startify_session_dir =  $DATA_PATH.'/session'
let g:startify_files_number = 4

let g:startify_bookmarks = [{'z': '~/.zshrc'}]
let g:startify_enable_special = 0
let g:startify_commands = [
        \ {'e': ['Open Empty Buffer', ':tabnew']},
        \ {'h': ['Read the Manual', 'h ref']},
        \ {'f': ['List Files', 'Clap files']},
        \ {'u': ['Update Plugins', 'PackUpdate']},
        \ {'c': ['Uninstall Unused Plugins', 'PackClean']},
        \ {'s': ['View Status of Plugins', 'PackStatus']},
        \ {'t': ['View Startup Time', 'packadd startuptime.vim | StartupTime']},
        \ {'m': ['View Coc Extensions Marketplace', 'CocList marketplace']},
        \ {'q': ['Quit', ':q!']},
        \ ]

let g:startify_lists = [
    \ { 'type' : 'dir',         'header' : ['   My most recently used files in the current directory:']},
    \ { 'type' : 'files',       'header' : ['   My most recently used files:']},
    \ { 'type' : 'sessions',    'header' : ['   These are my sessions:']},
    \ { 'type' : 'bookmarks',   'header' : ['   These are my bookmarks:']},
    \ { 'type' : 'commands',    'header' : ['   Quick Commands']       },
\ ]

let g:startify_skiplist = [
    \ 'COMMIT_EDITMSG',
    \ escape(fnamemodify(resolve($VIMRUNTIME), ':p'), '\') .'doc',
    \ 'bundle/.*/doc',
\ ]

"let s:totalPlugins  = substitute(system('cat ~/.config/nvim/config/pack.vim | rg minpac#add  | wc -l'), '\n', '', 'g')
"let s:lazyPlugins   = substitute(system('cat ~/.config/nvim/config/pack.vim | rg minpac#add | rg type | wc -l'), '\n', '', 'g')
"let s:lazyPercent   = float2nr(round(s:lazyPlugins * 1.0 / s:totalPlugins * 100))
"let g:footer = [
"    \ 'Total Plugins: ' . s:totalPlugins,
"    \ 'Lazily Loaded: ' . s:lazyPlugins . ' (' . s:lazyPercent . '%)',
"    \]

let g:startify_custom_header = s:center(g:header)
let g:startify_custom_footer = s:center(g:footer)

]]
