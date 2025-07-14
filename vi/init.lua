--"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
--"   	     __          ___ _             _
--" 		  /\ \ \___     / _ \ |_   _  __ _(_)_ __  ___
--" 		 /  \/ / _ \   / /_)/ | | | |/ _` | | '_ \/ __|
--"		/ /\  / (_) | / ___/| | |_| | (_| | | | | \__ \
--"		\_\ \/ \___/  \/    |_|\__,_|\__, |_|_| |_|___/
--"                                    |___/
--"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

vim.cmd.colorscheme("unokai")
-- Options
vim.g.mapleader = " " -- sets leader key to <SPACE>
vim.opt.spell = true -- set spell on
vim.opt.spelllang = "en_us"
vim.opt.title = true -- show title
vim.opt.keywordprg = ":help" -- Replace :man with :help, fix `K` freeze | :h keywordprg
vim.opt.syntax = "ON" -- maybe just set syntax
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
vim.opt.background = "dark" -- use dark theme only
--vim.cmd('colorscheme habamax')			-- set colorscheme
--vim.cmd('filetype plugin on')			-- set filetype

-- Basic settings
vim.opt.number = true -- Line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.wrap = false -- enable text wrapping
vim.opt.scrolloff = 10 -- Keep 10 lines above/below cursor
vim.opt.sidescrolloff = 8 -- Keep 8 columns left/right of cursor

-- Search
vim.opt.ignorecase = true -- enable case insensitive searching
vim.opt.smartcase = true -- all searches are case insensitive unless there's a capital letter
vim.opt.hlsearch = true -- disable all highlighted search results
vim.opt.incsearch = true -- enable incremental searching

-- File handling
vim.opt.backup = false -- Don't create backup files
vim.opt.writebackup = false -- Don't create backup before writing
vim.opt.swapfile = false -- Don't create swap files
vim.opt.undofile = true -- Persistent undo
vim.opt.undodir = vim.fn.expand("~/.vim/undodir") -- Undo directory
vim.opt.updatetime = 300 -- Faster completion
vim.opt.timeoutlen = 500 -- Key timeout duration
vim.opt.ttimeoutlen = 0 -- Key code timeout
vim.opt.autoread = true -- Auto reload files changed outside vim
vim.opt.autowrite = false -- Don't auto save

-- Visual settings
vim.opt.termguicolors = true -- Enable 24-bit colors
vim.opt.signcolumn = "yes" -- Always show sign column
-- vim.opt.colorcolumn = "100"                        -- Show column at 100 characters
vim.opt.showmatch = true -- Highlight matching brackets
vim.opt.matchtime = 2 -- How long to show matching bracket
vim.opt.cmdheight = 1 -- Command line height
vim.opt.completeopt = "menuone,noinsert,noselect" -- Completion options
vim.opt.conceallevel = 0 -- Don't hide markup
vim.opt.concealcursor = "" -- Don't hide cursor line markup
vim.opt.lazyredraw = true -- Don't redraw during macros
vim.opt.synmaxcol = 300 -- Syntax highlighting limit

-- Behavior settings
vim.opt.hidden = true -- Allow hidden buffers
vim.opt.errorbells = false -- No error bells
vim.opt.backspace = "indent,eol,start" -- Better backspace behavior
vim.opt.autochdir = false -- Don't auto change directory
vim.opt.iskeyword:append("-") -- Treat dash as part of word
-- vim.opt.path:append("**")                          -- include subdirectories in search
vim.opt.selection = "exclusive" -- Selection behavior
vim.opt.mouse = "a" -- Enable mouse support
-- vim.opt.clipboard:append("unnamedplus")            -- Use system clipboard
vim.opt.modifiable = true -- Allow buffer modifications

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

-- Paste text but DONT copy the overridden text
map("x", "p", [["_dP]])

-- Delete text but DONT copy to clipboard
map({ "n", "v" }, "<leader>d", [["_d]])

-- Align
map({ "n", "i" }, "<A-j>", "<Esc>:m .+1<CR>==") -- Move current line down
map({ "n", "i" }, "<A-k>", "<Esc>:m .-2<CR>==") -- Move current line up
map("v", "<A-j>", ":m '>+1<CR>gv=gv") -- Move selection line up
map("v", "<A-k>", ":m '<-2<CR>gv=gv") -- Move selection line up
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '>-2<CR>gv=gv")

-- Better indenting in visual mode
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

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

-- Quick config editing
map("n", "<leader>rc", ":e ~/.config/vi/init.lua<CR>", { desc = "Edit config" })

-- Misc
map("n", "<C-z>", ":setlocal spell! spelllang=en_us<CR>") -- Spell-check on\off
map("n", "<leader>ff", ":find ", { desc = "Find file" })

-- AutoCOMMANDS

-- Mode based Cursorline
vim.opt.cursorline = true -- current line Highlight
vim.api.nvim_create_autocmd("InsertEnter", {
	pattern = "*",
	callback = function()
		vim.o.cursorline = false
	end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	callback = function()
		vim.o.cursorline = true
	end,
})

-- Copy Full File-Path
map("n", "<leader>pa", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end)

-- Create undo directory if it doesn't exist
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end

-- Basic autocommands
local augroup = vim.api.nvim_create_augroup("UserConfig", {})

--vim.api.nvim_create_autocmd("BufWrite",
--	{
--		pattern = "*",
--		callback = function()
--			vim.cmd [[%s/\s\+$//e]] -- remove trailing whitespace
--			vim.cmd [[%s/\n\+\%$//e]] -- remove trailing newlines
--			vim.lsp.buf.format()
--		end
--	})
-- ============================================================================
-- FLOATING TERMINAL
-- ============================================================================

-- terminal
local terminal_state = {
	buf = nil,
	win = nil,
	is_open = false,
}

local function FloatingTerminal()
	-- If terminal is already open, close it (toggle behavior)
	if terminal_state.is_open and vim.api.nvim_win_is_valid(terminal_state.win) then
		vim.api.nvim_win_close(terminal_state.win, false)
		terminal_state.is_open = false
		return
	end

	-- Create buffer if it doesn't exist or is invalid
	if not terminal_state.buf or not vim.api.nvim_buf_is_valid(terminal_state.buf) then
		terminal_state.buf = vim.api.nvim_create_buf(false, true)
		-- Set buffer options for better terminal experience
		vim.api.nvim_buf_set_option(terminal_state.buf, "bufhidden", "hide")
	end

	-- Calculate window dimensions
	local width = math.floor(vim.o.columns * 0.8)
	local height = math.floor(vim.o.lines * 0.8)
	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	-- Create the floating window
	terminal_state.win = vim.api.nvim_open_win(terminal_state.buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		style = "minimal",
		border = "rounded",
	})

	-- Set transparency for the floating window
	vim.api.nvim_win_set_option(terminal_state.win, "winblend", 0)

	-- Set transparent background for the window
	vim.api.nvim_win_set_option(
		terminal_state.win,
		"winhighlight",
		"Normal:FloatingTermNormal,FloatBorder:FloatingTermBorder"
	)

	-- Define highlight groups for transparency
	vim.api.nvim_set_hl(0, "FloatingTermNormal", { bg = "none" })
	vim.api.nvim_set_hl(0, "FloatingTermBorder", { bg = "none" })

	-- Start terminal if not already running
	local has_terminal = false
	local lines = vim.api.nvim_buf_get_lines(terminal_state.buf, 0, -1, false)
	for _, line in ipairs(lines) do
		if line ~= "" then
			has_terminal = true
			break
		end
	end

	if not has_terminal then
		vim.fn.termopen(os.getenv("SHELL"))
	end

	terminal_state.is_open = true
	vim.cmd("startinsert")

	-- Set up auto-close on buffer leave
	vim.api.nvim_create_autocmd("BufLeave", {
		buffer = terminal_state.buf,
		callback = function()
			if terminal_state.is_open and vim.api.nvim_win_is_valid(terminal_state.win) then
				vim.api.nvim_win_close(terminal_state.win, false)
				terminal_state.is_open = false
			end
		end,
		once = true,
	})
end

-- Function to explicitly close the terminal
local function CloseFloatingTerminal()
	if terminal_state.is_open and vim.api.nvim_win_is_valid(terminal_state.win) then
		vim.api.nvim_win_close(terminal_state.win, false)
		terminal_state.is_open = false
	end
end

-- Key mappings
vim.keymap.set("n", "<leader>t", FloatingTerminal, { noremap = true, silent = true, desc = "Toggle floating terminal" })
vim.keymap.set("t", "<Esc>", function()
	if terminal_state.is_open then
		vim.api.nvim_win_close(terminal_state.win, false)
		terminal_state.is_open = false
	end
end, { noremap = true, silent = true, desc = "Close floating terminal from terminal mode" })

-- Auto-close terminal when process exits
vim.api.nvim_create_autocmd("TermClose", {
	group = augroup,
	callback = function()
		if vim.v.event.status == 0 then
			vim.api.nvim_buf_delete(0, {})
		end
	end,
})

-- Disable line numbers in terminal
vim.api.nvim_create_autocmd("TermOpen", {
	group = augroup,
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.signcolumn = "no"
	end,
})

-- Auto-resize splits when window is resized
vim.api.nvim_create_autocmd("VimResized", {
	group = augroup,
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

-- ============================================================================
-- STATUSLINE
-- ============================================================================
-- File type with icon
local function file_type()
	local ft = vim.bo.filetype
	local icons = {
		lua = "[LUA]",
		python = "[PY]",
		javascript = "[JS]",
		html = "[HTML]",
		css = "[CSS]",
		json = "[JSON]",
		markdown = "[MD]",
		vim = "[VIM]",
		sh = "[SH]",
	}

	if ft == "" then
		return "  "
	end

	return (icons[ft] or ft)
end

-- LSP status
local function lsp_status()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if #clients > 0 then
		return "  LSP "
	end
	return ""
end

-- Word count for text files
local function word_count()
	local ft = vim.bo.filetype
	if ft == "markdown" or ft == "text" or ft == "tex" then
		local words = vim.fn.wordcount().words
		return "  " .. words .. " words "
	end
	return ""
end

-- File size
local function file_size()
	local size = vim.fn.getfsize(vim.fn.expand("%"))
	if size < 0 then
		return ""
	end
	if size < 1024 then
		return size .. "B "
	elseif size < 1024 * 1024 then
		return string.format("%.1fK", size / 1024)
	else
		return string.format("%.1fM", size / 1024 / 1024)
	end
end

-- Mode indicators with icons
local function mode_icon()
	local mode = vim.fn.mode()
	local modes = {
		n = "NORMAL",
		i = "INSERT",
		v = "VISUAL",
		V = "V-LINE",
		["\22"] = "V-BLOCK", -- Ctrl-V
		c = "COMMAND",
		s = "SELECT",
		S = "S-LINE",
		["\19"] = "S-BLOCK", -- Ctrl-S
		R = "REPLACE",
		r = "REPLACE",
		["!"] = "SHELL",
		t = "TERMINAL",
	}
	return modes[mode] or "  " .. mode:upper()
end

_G.mode_icon = mode_icon
_G.file_type = file_type
_G.file_size = file_size
_G.lsp_status = lsp_status

vim.cmd([[
  highlight StatusLineBold gui=bold cterm=bold
]])

-- Function to change statusline based on window focus
local function setup_dynamic_statusline()
	vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
		callback = function()
			vim.opt_local.statusline = table.concat({
				"  ",
				"%#StatusLineBold#",
				"%{v:lua.mode_icon()}",
				"%#StatusLine#",
				" │ %f %h%m%r",
				--   "%{v:lua.git_branch()}",
				" │ ",
				"%{v:lua.file_type()}",
				" | ",
				"%{v:lua.file_size()}",
				" | ",
				"%{v:lua.lsp_status()}",
				"%=", -- Right-align everything after this
				"%l:%c  %P ", -- Line:Column and Percentage
			})
		end,
	})
	vim.api.nvim_set_hl(0, "StatusLineBold", { bold = true })

	vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
		callback = function()
			vim.opt_local.statusline = "  %f %h%m%r │ %{v:lua.file_type()} | %=  %l:%c   %P "
		end,
	})
end

setup_dynamic_statusline()

-- Auto Hlsearch
vim.on_key(function(char)
	if vim.fn.mode(1) == "n" then
		local new_hlsearch = vim.iter({ "<CR>", "n", "N", "*", "#", "?", "/" }):find(vim.fn.keytrans(char)) ~= nil
		if vim.opt.hlsearch:get() ~= new_hlsearch then
			vim.opt.hlsearch = new_hlsearch
		end
	end
end, vim.api.nvim_create_namespace("auto_hlsearch"))
-- <CMD> to hot-Reload config
vim.api.nvim_create_user_command("ReloadConfig", 'source vim.fn.stdpath("config").. "init.lua"', {})
--vim.api.nvim_create_user_command('OpenConfig', ':exe edit vim.fn.stdpath("config").. "init.lua"', {})

local group = vim.api.nvim_create_augroup("user_cmds", { clear = true })

-- Highlight Yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = group,
	desc = "Highlight on yank",
	callback = function()
		vim.highlight.on_yank({ higroup = "ErrorMsg", timeout = 300 })
	end,
})
-- quit help with 'q'
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "help", "man" },
	group = group,
	command = "nnoremap <buffer> q <cmd>quit<cr>",
})

------------------------------
-- FileBrowser
map("n", "<leader>e", ":Lex<CR>") -- space+e toggles netrw tree view
map("n", "<leader>o", ":Explore<CR>") -- Open file-picker
vim.g.netrw_browse_split = 4 -- open in prior window
vim.g.netrw_keepdir = 0 -- Sync current directory with browsing directory
vim.g.netrw_altv = 1 -- change from left splitting to right splitting
vim.g.netrw_banner = 0 -- gets rid of the annoying banner for netrw
vim.g.netrw_liststyle = 3 -- tree style view in netrw
vim.g.netrw_winsize = 15 -- window size
-- Netrw Keymaps
local function netrw_mapping()
	local bufmap = function(lhs, rhs)
		local opts = { buffer = true, remap = true }
		vim.keymap.set("n", lhs, rhs, opts)
	end

	--  -- close window
	--  bufmap('<leader>e', ':Lexplore<cr>')
	--  bufmap('<leader>E', ':Lexplore<cr>')

	-- Go back in history
	bufmap("H", "u")

	-- Go up a directory
	bufmap("h", "-^")

	-- Open file/directory
	bufmap("l", "<cr>")

	-- Open file/directory then close explorer
	bufmap("L", "<cr>:Lexplore<CR>")

	-- Toggle dotfiles
	bufmap(".", "gh")
end
vim.api.nvim_create_autocmd("FileType", {
	pattern = "netrw",
	group = group,
	desc = "Keybindings for netrw",
	callback = netrw_mapping,
})
------------------------------
-- Completion from :h ins-completion
vim.opt.omnifunc = "syntaxcomplete#Complete" -- Auto Completion - Enable Omni complete features
vim.cmd("set complete+=k") -- Enable Spelling Suggestions for Auto-Completion:
vim.opt.completeopt = { "menu", "menuone", "noinsert" } -- Completion options

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
--------------------------------
-- ************** YANK RING ***************************
-- ─────────────── REGISTER ALLOCATION SCHEME ────────────────────────
-- ╭───┬──────────────────────────┬───┬──────────────────╮
-- │ 1 │ Last delete              │ 0 │ Last yank        │
-- │ 2 │ Second last delete       │ 9 │ Second last yank │
-- │ 3 │ Third last delete        │ 8 │ Third last yank  │
-- │ 4 │ Fourth last delete       │ 7 │ Fourth last yank │
-- │ 5 │ Fifth last delete        │ 6 │ Fifth last yank  │
-- ╰───┴──────────────────────────┴───┴──────────────────╯
local prev0, prev9
vim.api.nvim_create_autocmd("VimEnter", {
	group = vim.api.nvim_create_augroup("yank_history", {}),
	desc = "Store previous yanks in latter half of numbered registers (VimEnter hooks)",
	pattern = "*",
	callback = function()
		prev0 = vim.fn.getreginfo("0")
		prev9 = vim.fn.getreginfo("9")
	end,
})
vim.api.nvim_create_autocmd("TextYankPost", {
	group = "yank_history",
	desc = "Store previous yanks in latter half of numbered registers",
	pattern = "*",
	callback = function()
		if vim.v.event.regname ~= "" then
			return
		end
		vim.fn.setreg("6", vim.fn.getreginfo("7"))
		vim.fn.setreg("7", vim.fn.getreginfo("8"))
		vim.fn.setreg("8", vim.fn.getreginfo("9"))
		if vim.v.event.operator == "y" then
			prev0.isunnamed = false
			vim.fn.setreg("9", prev0)
			prev9 = vim.fn.getreginfo("9")
			prev0 = vim.fn.getreginfo("0")
		else
			vim.fn.setreg("9", prev9)
		end
	end,
})

-- *** Everything below implements cycle functionality ***
local last_put_type = nil
local last_cycle_register = nil
vim.api.nvim_create_augroup("yank_cycle", {})
local function register_autocmd()
	vim.api.nvim_create_autocmd("CursorMoved", {
		group = "yank_cycle",
		desc = "Disallow cycling when cursor was moved, or cursorline changed",
		pattern = "*",
		callback = function()
			last_put_type = nil
			last_cycle_register = nil
		end,
	})
end

local function hook_put_actions(mode, key)
	vim.keymap.set(mode, key, function()
		last_put_type = key
		vim.api.nvim_clear_autocmds({ group = "yank_cycle" })
		vim.schedule(register_autocmd)
		return key
	end, { expr = true, desc = "Track put actions" })
end
for _, key in ipairs({ "p", "P", "gp", "gP", "zp", "zP", "[p", "]p" }) do
	hook_put_actions("n", key)
end
local function cycle_put(amount)
	return function()
		if last_put_type ~= nil then
			if last_cycle_register == nil then
				last_cycle_register = tonumber(vim.fn.getreginfo('"').points_to) or 0
			end
			last_cycle_register = (last_cycle_register + amount) % 10
			local meta = getmetatable(vim.fn.getreginfo(tostring(last_cycle_register)))
			if meta ~= getmetatable(vim.empty_dict()) then
				vim.cmd.normal(string.format('u"%d%s', last_cycle_register, last_put_type))
				vim.api.nvim_echo({ { string.format("Paste using [%d/9]", last_cycle_register) } }, false, {})
			else
				vim.api.nvim_echo(
					{ { string.format("Skipping register %d since it's empty", last_cycle_register), "ErrorMsg" } },
					false,
					{}
				)
			end
		else
			vim.api.nvim_echo({ { "Cannot cycle put. Cursor has moved", "ErrorMsg" } }, false, {})
		end
	end
end
vim.keymap.set("n", "<c-n>", cycle_put(1), { desc = "Swap put with next register" })
vim.keymap.set("n", "<c-p>", cycle_put(-1), { desc = "Swap put with previous register" })

-- Copy LSP Implentatation from https://github.com/radleylewis/nvim-lite/blob/34b789ad42212d30d0c071e3263c98e2afaf1e8d/init.lua#L467
