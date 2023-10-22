local o = vim.opt
-- disable netrw , For NerdTree but can't
-- vim.g.loaded_netrw       = 1
-- vim.g.loaded_netrwPlugin = 1
-- Troubleshoot
o.keywordprg = ":help" -- Replace :man with :help, fix `K` freeze | :h keywordprg
o.virtualedit = "onemore"

o.swapfile = true -- disable swap files
-- File
-- o.fileencoding           = "utf-8" -- the encoding written to a file
o.backupcopy = "yes" -- fix weirdness for stuff that replaces the entire file when hot reloading
-- Fancy
o.conceallevel = 3 -- Hide conceal text {3}

-- -- Spell
-- o.spell = true
-- o.spelllang = { 'en_us' }
-- line number
o.relativenumber = false -- make use relative num
o.number = true -- get numbers on left side

-- tabs & indent
o.textwidth = 80 -- Only allowed chracter to typed in a sentence
o.colorcolumn = "80" --  a Vertical line to indicate TEXTWIDTH
o.whichwrap = "<,>,h,l" -- Allow h,l,left,right key to move to next life it reaches end of line
-- o.tabstop                = 4 -- X mean how many SPACES instead of TAB,i used 4
-- o.shiftwidth             = 2 -- tell << & >> to shift how many SPACES
o.expandtab = true -- tabs are SPACES
o.softtabstop = 2 -- DEL how many SPACES with <BS>
o.smartindent = true -- automatic indent on new line
o.autoindent = true -- maybe auto?
o.wildmenu = true -- fancy/visual auto-cmp for cmdline

-- file
-- Allow undo-ing even after save file
o.undodir = vim.fn.stdpath("config") .. "/.tmp/undo"
o.undofile = true
-- Hide 'No write since last change' error on switching buffers Keeps buffer open in the background.
o.hidden = true
-- line wrapping
o.scrolloff = 6 -- only show X line below & above while scrolling
o.sidescrolloff = 14 -- scroll limit for lines
o.wrap = true -- default unable already no need
o.linebreak = true -- no more word break in wrapping
o.wrapmargin = 0 -- wrap only when window can't handle text correctly

-- Search settings
o.ignorecase = true -- your searches will be case-insensitive. ignorecase is needed for smartcase to work
o.smartcase = true -- Your search will be case-sensitive if it contains an uppercase letter.
o.hlsearch = false -- highlight as u /search
o.incsearch = true

-- UI & plugin needs
-- Cursor line
-- o.cursorline = true -- highlight currunt line | having a plugin now

-- appearance
--o.background = "dark" -- also used for thmes support | idk realy
o.termguicolors = true -- most of theme need it
o.showmatch = true -- highlight matching [{()}]
-- o.guifont = "Maple Mono SC NF,Delugia:h13" -- Font and size
o.guifont = "Sarasa Term J Nerd Font,Delugia:h13" -- Font and size
-- o.signcolumn = "yes"                              --- when i said do not use what u dont know
--o.showcmd = true -- show commands in bottom bar

-- Statusline
o.laststatus = 2 -- Or 3 for global statusline
-- <BS>
--o.backspace = "indent,eol,start" -- i Don't know about it

-- clipboard  force sys to combine  i dont want it
--o.clipboard:append("unnamedplus")

-- split windows
o.splitright = true
o.splitbelow = true

-- -- Fold
-- o.foldmethod = "manual"

-- disable builtin plugins as they are not needed
-- local disabled_built_ins = {
-- 	-- "netrw",
-- 	-- "netrwPlugin",
-- 	-- "netrwSettings",
-- 	-- "netrwFileHandlers",
-- 	-- "gzip",
-- 	-- "zip",
-- 	-- "zipPlugin",
-- 	-- "tar",
-- 	-- "tarPlugin",
-- 	"getscript",
-- 	"getscriptPlugin",
-- 	"vimball",
-- 	"vimballPlugin",
-- 	"2html_plugin",
-- 	"logipat",
-- 	"rrhelper",
-- 	-- "spellfile_plugin",
-- 	-- "matchit"
-- }
--
-- for _, plugin in pairs(disabled_built_ins) do
-- 	vim.g["loaded_" .. plugin] = 1
-- end
--
--
-- -- Set shell to PowerShell 7 if on Win32 or Win64
-- -- but cmd is far better
-- if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
-- 	o.shell = "pwsh -NoLogo"
-- 	o.shellcmdflag =
-- 		"-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
-- 	o.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
-- 	o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
-- 	o.shellquote = ""
-- 	o.shellxquote = ""
-- end
