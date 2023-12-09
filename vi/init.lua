--"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
--"   	     __          ___ _             _
--" 		  /\ \ \___     / _ \ |_   _  __ _(_)_ __  ___
--" 		 /  \/ / _ \   / /_)/ | | | |/ _` | | '_ \/ __|
--"		/ /\  / (_) | / ___/| | |_| | (_| | | | | \__ \
--"		\_\ \/ \___/  \/    |_|\__,_|\__, |_|_| |_|___/
--"                                    |___/
--"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

-- Options
vim.g.mapleader = " " -- sets leader key to <SPACE>
vim.opt.spell = true -- set spell on
vim.opt.spelllang= 'en_us'
vim.opt.title = true -- show title
vim.opt.keywordprg = ":help" -- Replace :man with :help, fix `K` freeze | :h keywordprg
vim.opt.syntax = "ON" -- maybe just set syntax
vim.opt.backup = false -- set backup
vim.opt.cursorline = true  -- current line Highlight
vim.opt.number = true -- turn on line numbers
vim.opt.ignorecase = true -- enable case insensitive searching
vim.opt.smartcase = true -- all searches are case insensitive unless there's a capital letter
vim.opt.hlsearch = true -- disable all highlighted search results
vim.opt.incsearch = true -- enable incremental searching
vim.opt.wrap = false -- enable text wrapping
vim.opt.fileencoding = "utf-8" -- encoding set to utf-8
vim.opt.showtabline = 1 -- always show the tab line  1 = if at-least 2 tab, 2 = always, 0 = never
vim.opt.laststatus = 2 -- always show statusline
vim.opt.expandtab = false -- expand tab
vim.opt.smarttab = true --
vim.opt.smartindent = true
vim.opt.scrolloff = 8 -- scroll page when cursor is 8 lines from top/bottom
vim.opt.sidescrolloff = 8 -- scroll page when cursor is 8 spaces from left/right
vim.opt.guifont = "monospace:h17"
vim.opt.wildignore = "*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx" -- files that u never want to edit
vim.opt.splitbelow = true -- split go below
vim.opt.splitright = true -- vertical split to the right
vim.opt.termguicolors = true -- terminal gui colors
vim.opt.background = "dark" -- use dark theme only
--vim.cmd('colorscheme habamax')			-- set colorscheme
--vim.cmd('filetype plugin on')			-- set filetype

-- Undo
vim.opt.undodir = vim.fn.stdpath("data") .. "/vi/undo"
vim.opt.undofile = true

-- Function's

-- CMD-BINDS
-- KEYBINDS
-- Functional wrapper for mapping custom keybindings
local map = vim.keymap.set


-- Line movement Soft wrap movement fix
map("n", "j", "gj") -- move vert by visual line
map("n", "k", "gk") -- move vert by visual line
-- HL as amplified versions of hjkl
map({ "n", "v" }, "H", "0^") -- "beginning of line"
map({ "n", "v" }, "L", "$") --"end of line" ,
map({ "n", "v" }, "M", "gm") --"middle of line" ,

-- Easy way to get back to normal mode from home row
map("i", "kj", "<Esc>") -- kj simulates ESC
map("i", "jk", "<Esc>") -- jk simulates ESC

-- Tabs
map("n", "<leader>to", ":tabnew<CR>") -- open new Tab
map("n", "<leader>tx", ":tabclose<CR>") -- close current tab
map("n", "<leader>tn", ":tabn<CR>") -- go to next tab
map("n", "<leader>tb", ":tabp<CR>") -- go to prev tab

-- Splits  & Windows
map("n", "<leader>sh", "<C-w>v") -- split window vert
map("n", "<leader>sv", "<C-w>s") -- split window horiz
map("n", "<leader>se", "<C-w>=") -- make window equal width
map("n", "<leader>sx", ":close<CR>") -- close current split
map("n", "<leader>x", ":close<CR>") -- close current split

-- Split Navigation
map("n", "<C-h>", "<C-w>h") -- control+h switches to left split
map("n", "<C-l>", "<C-w>l") -- control+l switches to right split
map("n", "<C-j>", "<C-w>j") -- control+j switches to bottom split
map("n", "<C-k>", "<C-w>k") -- control+k switches to top split

-- Split Resize
map("n", "<C-S-Left>", ":vertical resize +3<CR>") -- Control+Left resizes vertical split +
map("n", "<C-S-Right>", ":vertical resize -3<CR>") -- Control+Right resizes vertical split -
map("n", "<C-S-h>", "<C-w><") -- resize window to left
map("n", "<C-S-l>", "<C-w>>") -- resize window to right
map("n", "<C-S-k>", "<C-w>+") -- resize window to up
map("n", "<C-S-j>", "<C-w>-") -- resize window to down

-- buffer navigation
map("n", "<leader>n", ":bnext <CR>") --  to next buffer
map("n", "<leader>b", ":bprevious <CR>") -- to previous buffer
map("n", "<leader>d", ":bd! <CR>") -- Space+d delets current buffer

-- Clipboard
map({ "i", "c" }, "<C-v>", "<C-R>+", { desc = "Paste from clipboard" })
map({ "n", "v" }, "<C-v>", '"+gP', { desc = "Paste from clipboard" })
map({ "n", "v" }, "<C-c>", '"+y', { desc = "Copy to clipboard" })
map({ "v" }, "<C-x>", '"+x', { desc = "Cut to clipboard" })
-- paste text but DONT copy the overridden text
map("x", "p", [["_dP]])
-- delete text but DONT copy to clipboard
map({ "n", "v" }, "<leader>d", [["_d]])

-- Align
map({ "n", "i" }, "<A-j>", "<Esc>:m .+1<CR>==") -- Move current line down
map({ "n", "i" }, "<A-k>", "<Esc>:m .-2<CR>==") -- Move current line up
map("v", "<A-j>", ":m '>+1<CR>gv=gv") -- Move current line up
map("v", "<A-k>", ":m '<-2<CR>gv=gv") -- Move current line up
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '>-2<CR>gv=gv")

-- Quit
map("n", "<leader>qw", ":qw<CR>", { desc = "Save & quit" })
map("n", "<leader>wq", ":qw<CR>", { desc = "Save & quit" })
map("n", "<leader>q!", ":q!<CR>", { desc = "Quit all buffer without save" })
map("n", "<leader>q1", ":q!<CR>", { desc = "Quit all buffer without save" })
map("n", "<leader>qq", ":q<CR>", { desc = "Quit buffer without save" })
map("n", "<leader>qa", ":qa<CR>", { desc = "Quit all buffer with save" })
map("n", "<M-q>", "<cmd>q<CR>")

-- Abbrev
vim.cmd("cnoreabbrev Q  q")
vim.cmd("cnoreabbrev q1  q!")
vim.cmd("cnoreabbrev Q1  q!")
vim.cmd("cnoreabbrev Qa1 qa!")
vim.cmd("cnoreabbrev Qa qa")
vim.cmd("cnoreabbrev W  w")
vim.cmd("cnoreabbrev Wq wq")
vim.cmd("cnoreabbrev WQ wq")
vim.cmd("cnoreabbrev Set set")
vim.cmd("cnoreabbrev SEt set")
vim.cmd("cnoreabbrev SET set")

-- Misc
map("v", "<leader>sr", '"hy:%s/<C-r>h//g<left><left>') -- Replace all instances of highlighted words
map("n", "<C-z>", ":setlocal spell! spelllang=en_us<CR>") -- Spell-check on\off

-- AutoCOMMANDS
------------------------------
-- Highlight Yank
vim.cmd([[
  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='ErrorMsg', timeout=300 }
  augroup END
]])
-- Mode based Cursorline
 vim.api.nvim_create_autocmd("InsertEnter", { pattern = "*", callback = function()
 	vim.o.cursorline = false
 end })
 vim.api.nvim_create_autocmd("InsertLeave", { pattern = "*", callback = function()
 	vim.o.cursorline = true
 end })
-- Format Trailing on save
vim.api.nvim_create_autocmd("BufWrite",
	{
		pattern = "*",
		callback = function()
			vim.cmd [[%s/\s\+$//e]] -- remove trailing whitespace
			vim.cmd [[%s/\n\+\%$//e]] -- remove trailing newlines
			vim.lsp.buf.format()
		end
	})
------------------------------
-- FileBrowser
map("n", "<leader>e", ":Lex<CR>") -- space+e toggles netrw tree view
map("n", "<leader>o", ":Explore<CR>") -- Open file-picker
vim.g.netrw_browse_split = 4 -- open in prior window
vim.g.netrw_keepdir = 0 -- Sync current directory with browsing directory
vim.g.netrw_altv = 1 -- change from left splitting to right splitting
vim.g.netrw_banner = 0 -- gets rid of the annoying banner for netrw
vim.g.netrw_liststyle= 3 -- tree style view in netrw
vim.g.netrw_winsize= 15   -- window size
vim.cmd("let g:netrw_list_hide=netrw_gitignore#Hide()")
------------------------------
-- Completion from :h ins-completion
vim.opt.omnifunc='syntaxcomplete#Complete' -- Auto Completion - Enable Omni complete features
vim.cmd("set complete+=k") -- Enable Spelling Suggestions for Auto-Completion:
vim.opt.completeopt={"menu", "menuone", "noinsert"}
vim.cmd([[
" Minimalist-Tab Complete
	inoremap <expr> <Tab> TabComplete()
	fun! TabComplete()
	    if getline('.')[col('.') - 2] =~ '\K' || pumvisible()
	        return "\<C-N>"
	    else
	        return "\<Tab>"
	    endif
	endfun
""""""""""""""""""""""""""""""""""""""""
" Minimalist-Autocomplete
	inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
	autocmd InsertCharPre * call AutoComplete()
	fun! AutoComplete()
	    if v:char =~ '\K'
	        \ && getline('.')[col('.') - 4] !~ '\K'
	        \ && getline('.')[col('.') - 3] =~ '\K'
	        \ && getline('.')[col('.') - 2] =~ '\K' " last char
	        \ && getline('.')[col('.') - 1] !~ '\K'

	        call feedkeys("\<C-N>", 'n')
	    end
	endfun
]])
-- Automatically Pair brackets, parethesis, and quotes
map("i", "'", "''<left>")
map("i", '"', '""<left>')
map("i", "(", "()<left>")
map("i", "[", "[]<left>")
map("i", "{", "{}<left>")
map("i", "{;", "{};<left><left>")
map("i", "/*", "/**/<left><left>")
------------------------------
