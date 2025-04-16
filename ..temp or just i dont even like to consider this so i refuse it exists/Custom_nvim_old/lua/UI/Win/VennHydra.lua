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

local Hydra = require("hydra")

-- -- Venn ART  NORMAL
-- Hydra({
--     name = "Draw Diagram",
--     body = "<leader>ve",
--     hint = [[
--     Arrow^^^^^^   Select region with <C-q>
--     ^ ^ _K_ ^ ^   _f_: surround it with box
--     _H_ ^ ^ _L_
--     ^ ^ _J_ ^ ^                      _<Esc>_
--    ]],
--     config = {
--         color = "pink",
--         invoke_on_body = true,
--         hint = {
--             border = "rounded",
--         },
--         on_enter = function()
--             vim.o.virtualedit = "all"
--         end,
--     },
--     mode = "n",
--     heads = {
--         { "H", "<C-v>h:VBox<CR>" },
--         { "J", "<C-v>j:VBox<CR>" },
--         { "K", "<C-v>k:VBox<CR>" },
--         { "L", "<C-v>l:VBox<CR>" },
--         { "f", ":VBox<CR>", { mode = "v" } },
--         { "<Esc>", nil, { exit = true } },
--     },
-- })
-- ──────────────────────────────────────────────────────────────────────
Hydra({
    name = "Draw Utf-8 Venn Diagram",
    body = "<leader>ve",
    hint = [[
 Arrow^^^^^^  Select region with <C-v>^^^^^^
 ^ ^ _K_ ^ ^  _f_: Surround with box ^ ^ ^ ^
 _H_ ^ ^ _L_  _<C-h>_: ◄, _<C-j>_: ▼
 ^ ^ _J_ ^ ^  _<C-k>_: ▲, _<C-l>_: ► _<C-c>_
]],
    config = {
        color = "pink",
        invoke_on_body = true,
        hint = {
            border = "rounded",
        },
        on_enter = function()
            vim.wo.virtualedit = "all"
        end,
    },
    mode = "n",
    heads = {
        { "<C-h>", "xi<C-v>u25c4<Esc>" }, -- mode = 'v' somehow breaks
        { "<C-j>", "xi<C-v>u25bc<Esc>" },
        { "<C-k>", "xi<C-v>u25b2<Esc>" },
        { "<C-l>", "xi<C-v>u25ba<Esc>" },
        { "H", "<C-v>h:VBox<CR>" },
        { "J", "<C-v>j:VBox<CR>" },
        { "K", "<C-v>k:VBox<CR>" },
        { "L", "<C-v>l:VBox<CR>" },
        { "f", ":VBox<CR>", { mode = "v" } },
        { "<C-c>", nil, { exit = true } },
    },
})

-- simplified ascii art with hydra
-- symbols (-,|,^,<,>,/,\)
-- capital letters: -| movements
-- C-letters: <v^>
-- leader clockwise (time running): \/ including movements
-- leader anti-clockwise (enough time): \/ without movements
-- leader hjkl: arrow including rectangular movements
-- _F_: surround^^   _f_: surround     ^^ ^
-- + corners ^  ^^   overwritten corners

Hydra({
    name = "Draw Ascii Diagram",
    body = "<leader>va",
    hint = [[
 -| moves: _H_ _J_ _K_ _L_
 <v^> arrow: _<C-h>_ _<C-j>_ _<C-k>_ _<C-l>_
 diagnoal + move: leader + clockwise like ◄ ▲
 _<leader>jh_ _<leader>hk_ _<leader>lj_ _<leader>kl_
 diagnoal + nomove: anticlockwise like ▲ + ◄
 _<leader>hj_ _<leader>kh_ _<leader>jl_ _<leader>lk_
 set +: _<leader>n_
 rectangle move + arrow, ie ► with ->
 _<leader>h_ _<leader>j_ _<leader>k_ _<leader>l_
                              _<C-c>_
]],
    config = {
        color = "pink",
        invoke_on_body = true,
        hint = {
            border = "rounded",
        },
        on_enter = function()
            vim.wo.virtualedit = "all"
        end,
    },
    mode = "n",
    heads = {
        { "<C-h>", "r<" },
        { "<C-j>", "rv" },
        { "<C-k>", "r^" },
        { "<C-l>", "r>" },
        { "H", "r-h" },
        { "J", "r|j" },
        { "K", "r|k" },
        { "L", "r-l" },
        { "<leader>jh", "r/hj" },
        { "<leader>hj", "r/" },
        { "<leader>hk", "r\\hk" },
        { "<leader>kh", "r\\" },
        { "<leader>lj", "r\\jl" },
        { "<leader>jl", "r\\" },
        { "<leader>kl", "r/kl" },
        { "<leader>lk", "r/" },
        { "<leader>n", "r+" },
        { "<leader>h", "r-hr<" },
        { "<leader>j", "r|jrv" },
        { "<leader>k", "r|kr^" },
        { "<leader>l", "r-lr>" },

        { "<C-c>", nil, { exit = true } },
    },
})

-- Window management has been in ../Tmux.lua
--
