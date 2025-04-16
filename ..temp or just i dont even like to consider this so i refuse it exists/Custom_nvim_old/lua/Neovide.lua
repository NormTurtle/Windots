-- vim.opt.linespace = 2 -- Controls spacing between lines, may also be negative.  -- not usefull at all
-- vim.o.guifont = "Delugia mono,Delugia:h14" -- change font * and its size
-- vim.o.guifont = "Delugia:h13" -- change font * and its size

vim.g.neovide_remember_window_size = true -- remember hte old window size

-- vim.g.neovide_padding_top = 7 -- TOP SPACE
-- vim.g.neovide_padding_bottom = -2 -- BTTOM SPACE
-- vim.g.neovide_padding_right = 70 -- RIGHT SPACE
-- vim.g.neovide_padding_left = 39 -- LEFT SPACE

-- TRANS 0.0-1.0
-- vim.g.neovide_transparency = 0.96

-- BlUR idk
-- vim.g.neovide_floating_blur_amount_x  =  6.0
-- vim.g.neovide_floating_blur_amount_y  =  5.0

-- -- ANIMATION LEGHT
-- -- vim.g.neovide_scroll_animation_length  =  0.100 -- in seconds
-- vim.g.neovide_refresh_rate = 50 -- default 60 \😳 big brain save battry
-- vim.g.neovide_refresh_rate_idle = 5 -- fps when not in focus
-- vim.g.neovide_profiler = true --  📉 show framtime graph
-- -- UI option
vim.g.neovide_hide_mouse_when_typing = true -- hide the Mouse when typing
vim.g.neovide_underline_automatic_scaling = true -- idk

-- Scaling
-- vim.g.neovide_scale_factor =  0.9 -- u can go negative but 1 is sweet spot
if vim.g.neovide == true then
	vim.api.nvim_set_keymap(
		"n",
		"<C-=>",
		":lua vim.g.neovide_scale_factor = math.min(vim.g.neovide_scale_factor + 0.1,  1.0)<CR>",
		{ silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"<C-->",
		":lua vim.g.neovide_scale_factor = math.max(vim.g.neovide_scale_factor - 0.1,  0.1)<CR>",
		{ silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"<C-+>",
		":lua vim.g.neovide_transparency = math.min(vim.g.neovide_transparency + 0.05, 1.0)<CR>",
		{ silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"<C-_>",
		":lua vim.g.neovide_transparency = math.max(vim.g.neovide_transparency - 0.05, 0.0)<CR>",
		{ silent = true }
	)
	vim.api.nvim_set_keymap("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 0.5<CR>", { silent = true })
	vim.api.nvim_set_keymap("n", "<C-)>", ":lua vim.g.neovide_transparency = 0.9<CR>", { silent = true })
end

-- Cursur
-- vim.g.neovide_cursor_animation_length  =  0.09 -- Cusrur animation in seconds
-- vim.g.neovide_cursor_trail_size =  0.50 -- Cursur Trail lag behind
-- vim.g.neovide_cursor_animate_in_insert_mode =  true -- use animate at insert
-- vim.g.neovide_cursor_animate_command_line =  true

-- INPUT settings
-- vim.g.neovide_input_use_logo = true -- allow all keys, ALT,WIN,*

-- allow Clipbaord copy paste
-- vim.opt.clipboard:append("unnamedplus")
-- vim.g.neovide_input_use_logo =  1 -- enable use of the logo (cmd) key
-- vim.keymap.set('n', '<C-s>', ':w<CR>') -- Save
-- vim.keymap.set('v', '<C-c>', '"+y') -- Copy
-- vim.keymap.set('n', '<C-V>', '"+P') -- Paste normal mode
-- vim.keymap.set('v', '<C-v>', '"+P') -- Paste visual mode
-- vim.keymap.set('c', '<C-v>', '<C-R>+') -- Paste command mode
-- vim.keymap.set('i', '<C-v>', '<ESC>l"+Pli') -- Paste insert mode

-- VFX
-- vim.g.neovide_cursor_vfx_mode =  "pixiedust"
-- vim.g.neovide_cursor_vfx_mode =  "ripple"

-- Plugin specific

-- vim.api.nvim_exec([[
--   autocmd FileType * if exists('g:neovide') | :TransparentDisable | endif
-- ]], false)

-- local colorscheme = "rose-pine-main"
-- local colorscheme = "accent"
-- local colorscheme = "blue-moon"
-- local colorscheme = "kyotonight"   -- kanagawa
-- local colorscheme = "kanagawa-wave"   -- kanagawa
-- local colorscheme = "catppuccin-frappe"
-- local colorscheme = "catppuccin-macchiato"
-- local colored, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
--   if not colored then
--    print("Colorscheme not found! Set to habamax") -- print error if colorscheme not installed
--    vim.cmd "colorscheme habamax"
--    return
--  end
