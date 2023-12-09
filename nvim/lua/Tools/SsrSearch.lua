--  ╭──────────────────────────────────────────────────────────╮
--  │ Treesitter based structural search and replace           │
--  │  plugin for Neovim.                                      │
--  ╰──────────────────────────────────────────────────────────╯
M = {
    { -- The Damn Search
        "cshuaimin/ssr.nvim",
        enabled = false,
        keys = "<leader>sr",
        config = function()
            vim.keymap.set({ "n", "x" }, "<leader>sr", function()
                require("ssr").open()
            end)
            require("ssr").setup({
                border = "rounded",
                min_width = 50,
                min_height = 5,
                max_width = 120,
                max_height = 25,
                keymaps = {
                    close = "q",
                    next_match = "n",
                    prev_match = "N",
                    replace_confirm = "<cr>",
                    replace_all = "<leader><cr>",
                },
            })
        end,
    },
}
return M
