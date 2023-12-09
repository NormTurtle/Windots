--  echo "<0_0>🗿"

-- Leader key before replace <SPACE>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- -- Calling me Lazy
require("Lazy")
-- Neovide
if vim.g.neovide then
    require("Neovide")
end
-- -- setting nvim
require("Options")
require("Autocmd")
require("Fm.NetRw")

-- Vimscript for things i dont't know lua
vim.cmd([[

" echom "<0_0>🗿"

 ]])
-- Command Abbreviations, I can't release my shift key fast enough :')
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

-- if not vim.g.neovide then
--Colorscheme
-- vim.cmd("au ColorScheme * hi Normal ctermbg=none guibg=none") -- Dimming | dim
-- local colorscheme = "oh-lucy"
-- local colorscheme = "oh-lucy-evening"
-- local colorscheme = "aura-dark-soft-text"
-- aura-dark, aura-dark-soft-text,aura-soft-dark,aura-soft-dark-soft-text
local colorscheme = "rose-pine"
-- local colorscheme = "tokyonight"
-- require("UI.Colors.rosepine")
-- local colorscheme = "blue-moon"
-- local colorscheme = "kanagawa-dragon"   -- kanagawa
-- local colorscheme = "kanagawa-wave"   -- kanagawa
-- local colorscheme = "catppuccin-frappe"
-- local colorscheme = "catppuccin-macchiato"
local colored, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not colored then
    print("Colorscheme not found! Set to habamax") -- print error if colorscheme not installed
    vim.cmd("colorscheme habamax")
    return
end
-- Window Separator
-- vim.api.nvim_set_hl(0, 'WinSeparator', { bg = '#1f1d2e', fg = '#eb6f92' })

-- end
-- Transparancy
-- if not vim.g.neovide then -- no transparent on neovide
--  -- set transparent on startup
-- vim.api.nvim_command('highlight Normal guibg=transparent ctermbg=none')
-- -- set transparent on colorscheme change
-- function set_transparency()
--   vim.api.nvim_command('highlight Normal guibg=transparent ctermbg=none')
-- end
-- vim.cmd('autocmd ColorScheme * call v:lua.set_transparency()')
-- end

-- function set_transparency()
--   -- Set transparency for Normal text
--   vim.api.nvim_command('highlight Normal guibg=transparent ctermbg=none')
--
--   -- Set transparency for other highlight groups
--   vim.api.nvim_command('highlight NonText guibg=transparent ctermbg=none')
--   vim.api.nvim_command('highlight SignColumn guibg=transparent ctermbg=none')
--   vim.api.nvim_command('highlight VertSplit guibg=transparent ctermbg=none')
--   vim.api.nvim_command('highlight StatusLine guibg=transparent ctermbg=none')
--   vim.api.nvim_command('highlight StatusLineNC guibg=transparent ctermbg=none')
-- end
-- -- Call set_transparency() whenever a color scheme is loaded
-- vim.cmd('autocmd ColorScheme * call v:lua.set_transparency()')

--  Keymaps
-- Leader is set before Lazy
-- vim.api.nvim_set_keymap('n', 'U', '<C-r>', { noremap = true } )
local key = vim.keymap -- for ease
-- vim.api.nvim_set_keymap("n", "U", "<C-R>", { noremap = true })

-- make good use of U (capital U) key
key.set("n", "U", "mzlblgueh~`z") -- change case of word
-- More text object
key.set("o", "ar", "a]") -- [r]ectangular bracket
key.set("o", "ac", "a}") -- [c]urly brace
key.set("o", "am", "aW") -- [m]assive word (= no shift needed)
key.set("o", "aq", 'a"') -- [q]uote
key.set("o", "az", "a'") -- [z]ingle quote
key.set("o", "ir", "i]")
key.set("o", "ic", "i}")
key.set("o", "im", "iW")
key.set("o", "iq", 'i"')
key.set("o", "iz", "i'")

-- Gui font resize MOUSE+CTRL
key.set("n", "<C-ScrollWheelUp>", ":set guifont=+<CR>")
key.set("n", "<C-ScrollWheelDown>", ":set guifont=-<CR>")

-- Line movement Soft wrap movement fix
key.set("n", "j", "gj") -- move vert by visual line
key.set("n", "k", "gk") -- move vert by visual line
-- HL as amplified versions of hjkl
key.set({ "n", "v" }, "H", "0^") -- "beginning of line"
key.set({ "n", "v" }, "L", "$") --"end of line" ,
key.set({ "n", "v" }, "M", "gm") --"middle of line" ,

-- vim.opt.scrolloff = 15 -- no more need for HML keys

-- Ecams like Cmd & Inset Readline  { ! = insert,Cmdline }
key.set("!", "<M-h>", "<Left>") --"move left"
vim.keymap.set("n", "<leader>h", "K") -- mnemonic: [h]over
key.set("!", "<M-l>", "<Right>") -- "move right"
key.set("!", "<M-j>", "<Down>") --  "move down"
key.set("!", "<M-k>", "<Up>") --  "move up"
key.set("!", "<C-f>", "<Right>") -- forward-char
key.set("!", "<C-b>", "<Left>") -- backward-char

-- Manipulation in insert mode - cmd mode
key.set("i", "<C-l>", "<Del>") -- delete like <delete> key to the right
key.set("c", "<C-l>", "<Del>") -- delete like <delete> key to the right
-- key.set('i', '<C-h>', '<BS>') -- delete like <backspace> key to the left  😂 neovim has it default

-- Nvim is EMacs now
key.set("i", "<M-b>", "<S-Left>") --"move left"
key.set("i", "<M-f>", "<S-Right>") -- "move right"

key.set("c", "<M-b>", "<S-Left>") --"move left"
key.set("c", "<M-f>", "<S-Right>") -- "move right"

-- highlight last edited or inserted text
key.set("n", "<Esc>", ":nohl<CR>")

-- Visual mode
-- key.set("v", "p", '"_dP', opts)      -- persist yanked word, not overwrite it

-- I use neovim, btw
-- edit load vimrc bindings
key.set("n", "<leader>Lc", ":exe 'edit' stdpath('config').'/init.lua'<CR>")
key.set("n", "<leader>LL", "<CMD>Lazy<CR>")
--key.set("n", "<leader>P", ":e "$profile"<CR>")

-- Splits  & windows
key.set("n", "<leader>sh", "<C-w>v") -- split window vert
key.set("n", "<leader>sv", "<C-w>s") -- split window horiz
key.set("n", "<leader>se", "<C-w>=") -- make window equal width
key.set("n", "<leader>sx", ":close<CR>") -- close current split

-- Tabs
key.set("n", "<leader>to", ":tabnew<CR>") -- open new Tab
key.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
key.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
key.set("n", "<leader>tp", ":tabp<CR>") -- go to prev tab

-- buffers
key.set("n", "<leader>n", ":bn<CR>") -- go to next tab
key.set("n", "<leader>b", ":bp<CR>") -- go to prev tab
-- key.set("n", "<C-s>", ":w<CR>") -- Save

-- Quit
key.set("n", "<leader>qw", ":qw<CR>", { desc = "Save & quit" })
key.set("n", "<leader>wq", ":qw<CR>", { desc = "Save & quit" })
key.set("n", "<leader>q!", ":q!<CR>", { desc = "Quit all buffer without save" })
key.set("n", "<leader>q1", ":q!<CR>", { desc = "Quit all buffer without save" })
key.set("n", "<leader>qq", ":q<CR>", { desc = "Quit buffer without save" })
key.set("n", "<leader>qa", ":qa<CR>", { desc = "Quit all buffer with save" })
key.set("n", "<M-q>", "<cmd>q<CR>")

-- Copy paste
key.set({ "i", "c" }, "<C-v>", "<C-R>+", { desc = "Paste from clipboard" })
key.set({ "n", "v" }, "<C-v>", '"+gP', { desc = "Paste from clipboard" })
key.set({ "n", "v" }, "<C-c>", '"+y', { desc = "Copy to clipboard" })
key.set({ "v" }, "<C-x>", '"+x', { desc = "Cut to clipboard" })
-- paste text but DONT copy the overridden text
key.set("x", "p", [["_dP]])
-- key.set("x", "<leader>p", [["+dP]])
-- delete text but DONT copy to clipboard
key.set({ "n", "v" }, "<leader>d", [["_d]])

-- Plugin Binding
local opts = { noremap = true, silent = true } -- icon, color picker uses it as (opts,)

-- Colors
key.set("i", "<C-S>", "<CMD>PickColorInsert<CR>", opts)

-- move text in Visual mode
-- vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
-- vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })

-- toggling Wrap modes
key.set("n", "yow", function()
    vim.cmd([[
    set wrap!
    if &wrap == 1 
      echom "Toggle to Wrap"
    else
      echom "Toggle to NoWrap"
    end
  ]])
end, { desc = "Toggle wrap mode", unique = true })

-- -_______________________
