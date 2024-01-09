-- Window Manager
local function cmd(command)
    return table.concat({ "<Cmd>", command, "<CR>" })
end
require("windows").setup({
    autowidth = { --		       |windows.autowidth|
        enable = false,
        winwidth = 5, --		        |windows.winwidth|
        filetype = { --	      |windows.autowidth.filetype|
            help = 2,
        },
    },
    ignore = { --			  |windows.ignore|
        buftype = { "quickfix" },
        filetype = { "NvimTree", "neo-tree", "undotree", "oil", "sfm" },
    },
    animation = {
        enable = true,
        duration = 100,
        fps = 30,
        easing = "in_out_sine",
    },
})

-- Windows keymaps
vim.keymap.set("n", "<Leader>z", cmd("WindowsMaximize"))
vim.keymap.set("n", "<Leader>sm", cmd("WindowsMaximize"))
vim.keymap.set("n", "<Leader>_", cmd("WindowsMaximizeVertically"))
vim.keymap.set("n", "<Leader>|", cmd("WindowsMaximizeHorizontally"))
vim.keymap.set("n", "<Leader>=", cmd("WindowsEqualize"))

-- smart-splits
require("smart-splits").setup({
    resize_mode = {
        silent = true,
        hooks = {
            on_enter = function()
                vim.notify("Entering resize mode")
            end,
            on_leave = function()
                vim.notify("Exiting resize mode, bye")
            end,
        },
    },
})
-- resizing splits
-- note : if `wezterm` use this
-- https://github.com/mrjones2014/smart-splits.nvim#wezterm-
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
vim.keymap.set("n", "<C-S-h>", require("smart-splits").resize_left)
vim.keymap.set("n", "<C-S-j>", require("smart-splits").resize_down)
vim.keymap.set("n", "<C-S-k>", require("smart-splits").resize_up)
vim.keymap.set("n", "<C-S-l>", require("smart-splits").resize_right)
-- moving between splits
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
-- swapping buffers between windows
vim.keymap.set("n", "<leader><leader>h", require("smart-splits").swap_buf_left)
vim.keymap.set("n", "<leader><leader>j", require("smart-splits").swap_buf_down)
vim.keymap.set("n", "<leader><leader>k", require("smart-splits").swap_buf_up)
vim.keymap.set("n", "<leader><leader>l", require("smart-splits").swap_buf_right)

-- ⠄⠄⣴⣶⣤⡤⠦⣤⣀⣤⠆⠄⠄⠄⠄⠄⣈⣭⣭⣿⣶⣿⣦⣼⣆⠄⠄⠄⠄⠄⠄⠄⠄--
-- ⠄⠄⠄⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦⠄⠄⠄⠄⠄⠄--
-- ⠄⠄⠄⠄⠄⠈⠄⠄⠄⠈⢿⣿⣟⠦⠄⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄⠄⠄⠄⠄--
-- ⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣸⣿⣿⢧⠄⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄⠄⠄⠄--
-- ⠄⠄⢀⠄⠄⠄⠄⠄⠄⢠⣿⣿⣿⠈⠄⠄⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀⠄⠄--
-- ⠄⠄⢠⣧⣶⣥⡤⢄⠄⣸⣿⣿⠘⠄⠄⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄⠄--
-- ⠄⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷⠄⠄⠄⢊⣿⣿⡏⠄⠄⢸⣿⣿⡇⠄⢀⣠⣄⣾⠄⠄⠄--
-- ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀⠄⢸⢿⣿⣿⣄⠄⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄⠄--
-- ⠙⠃⠄⠄⠄⣼⣿⡟⠌⠄⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿⠐⣿⣿⡇⠄⠛⠻⢷⣄--
-- ⠄⠄⠄⠄⠄⢻⣿⣿⣄⠄⠄⠄⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟⠄⠫⢿⣿⡆⠄⠄⠄⠁--
-- ⠄⠄⠄⠄⠄⠄⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃⠄⠄⠄⠄--
-- ⠄⠄⠄⠄⢰⣶⠄⠄⣶⠄⢶⣆⢀⣶⠂⣶⡶⠶⣦⡄⢰⣶⠶⢶⣦⠄⠄⣴⣶⠄⠄⠄⠄--
-- ⠄⠄⠄⠄⢸⣿⠶⠶⣿⠄⠈⢻⣿⠁⠄⣿⡇⠄⢸⣿⢸⣿⢶⣾⠏⠄⣸⣟⣹⣧⠄⠄⠄--
-- ⠄⠄⠄⠄⠸⠿⠄⠄⠿⠄⠄⠸⠿⠄⠄⠿⠷⠶⠿⠃⠸⠿⠄⠙⠷⠤⠿⠉⠉⠿⠆⠄⠄--

-- local Hydra = require('hydra')
local Hydra = require("hydra")
local splits = require("smart-splits")
local cmd = require("hydra.keymap-util").cmd
local pcmd = require("hydra.keymap-util").pcmd

local buffer_hydra = Hydra({
    name = "Barbar",
    config = {
        on_key = function()
            -- Preserve animation
            vim.wait(200, function()
                vim.cmd("redraw")
            end, 30, false)
        end,
    },
    heads = {
        {
            "h",
            function()
                vim.cmd("BufferPrevious")
            end,
            { on_key = false },
        },
        {
            "l",
            function()
                vim.cmd("BufferNext")
            end,
            { desc = "choose", on_key = false },
        },

        {
            "H",
            function()
                vim.cmd("BufferMovePrevious")
            end,
        },
        {
            "L",
            function()
                vim.cmd("BufferMoveNext")
            end,
            { desc = "move" },
        },

        {
            "p",
            function()
                vim.cmd("BufferPin")
            end,
            { desc = "pin" },
        },

        {
            "d",
            function()
                vim.cmd("BufferClose")
            end,
            { desc = "close" },
        },
        {
            "c",
            function()
                vim.cmd("BufferClose")
            end,
            { desc = false },
        },
        {
            "q",
            function()
                vim.cmd("BufferClose")
            end,
            { desc = false },
        },

        {
            "od",
            function()
                vim.cmd("BufferOrderByDirectory")
            end,
            { desc = "by directory" },
        },
        {
            "ol",
            function()
                vim.cmd("BufferOrderByLanguage")
            end,
            { desc = "by language" },
        },
        { "<Esc>", nil, { exit = true } },
    },
})

local function choose_buffer()
    if #vim.fn.getbufinfo({ buflisted = true }) > 1 then
        buffer_hydra:activate()
    end
end

vim.keymap.set("n", "gb", choose_buffer)

local window_hint = [[
 ^^^^^^^^^^^^     Move      ^^    Size   ^^   ^^     Split
 ^^^^^^^^^^^^-------------  ^^-----------^^   ^^---------------
 ^ ^ _k_ ^ ^  ^ ^ _K_ ^ ^   ^   _<C-k>_   ^   _s_: horizontally
 _h_ ^ ^ _l_  _H_ ^ ^ _L_   _<C-h>_ _<C-l>_   _v_: vertically
 ^ ^ _j_ ^ ^  ^ ^ _J_ ^ ^   ^   _<C-j>_   ^   _q_, _c_: close
 focus^^^^^^  window^^^^^^  ^_=_: equalize^   _z_, _f_: maximize
 ^ ^ ^ ^ ^ ^  ^ ^ ^ ^ ^ ^   ^^ ^          ^   _o_: remain only
 _b_: choose buffer
]]

Hydra({
    name = "Windows",
    hint = window_hint,
    config = {
        invoke_on_body = true,
        hint = {
            border = "rounded",
            offset = -1,
        },
    },
    mode = "n",
    body = "<C-w>",
    heads = {
        { "h", "<C-w>h" },
        { "j", "<C-w>j" },
        { "k", pcmd("wincmd k", "E11", "close") },
        { "l", "<C-w>l" },

        { "H", cmd("WinShift left") },
        { "J", cmd("WinShift down") },
        { "K", cmd("WinShift up") },
        { "L", cmd("WinShift right") },

        {
            "<C-h>",
            function()
                splits.resize_left(2)
            end,
        },
        {
            "<C-j>",
            function()
                splits.resize_down(2)
            end,
        },
        {
            "<C-k>",
            function()
                splits.resize_up(2)
            end,
        },
        {
            "<C-l>",
            function()
                splits.resize_right(2)
            end,
        },
        { "=", "<C-w>=", { desc = "equalize" } },

        { "s", pcmd("split", "E36") },
        { "<C-s>", pcmd("split", "E36"), { desc = false } },
        { "v", pcmd("vsplit", "E36") },
        { "<C-v>", pcmd("vsplit", "E36"), { desc = false } },

        { "w", "<C-w>w", { exit = true, desc = false } },
        { "<C-w>", "<C-w>w", { exit = true, desc = false } },

        { "z", cmd("WindowsMaximize"), { exit = true, desc = "maximize" } },
        { "f", cmd("WindowsMaximize"), { exit = true, desc = "maximize" } },
        { "<C-z>", cmd("WindowsMaximize"), { exit = true, desc = false } },

        { "o", "<C-w>o", { exit = true, desc = "remain only" } },
        { "<C-o>", "<C-w>o", { exit = true, desc = false } },

        { "b", choose_buffer, { exit = true, desc = "choose buffer" } },

        { "c", pcmd("close", "E444") },
        { "q", pcmd("close", "E444"), { desc = "close window" } },
        { "<C-c>", pcmd("close", "E444"), { desc = false } },
        { "<C-q>", pcmd("close", "E444"), { desc = false } },

        { "<Esc>", nil, { exit = true, desc = false } },
    },
})
