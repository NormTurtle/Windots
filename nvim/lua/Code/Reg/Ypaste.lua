--                  │ YANK CONF                                                │
--                  ╰──────────────────────────────────────────────────────────╯

return {
    {
        "gbprod/yanky.nvim",
        keys = { "Y", "y", "P", "p", "v", "V" },
        config = function()
            -- require("yanky").setup({ })
            require("yanky").setup({
                preserve_cursor_position = {
                    enabled = true,
                },
                ring = {
                    history_length = 10,
                    storage = "shada",
                },
                highlight = {
                    on_put = true,
                    on_yank = true,
                    timer = 500,
                },
            })
            -- MApping
            vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)") -- put after cursor
            vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)") -- put before cursor
            vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)") -- put after cursor and leave the cursor after
            vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)") -- put before cursor and leave the cursor after
            -- Rings | Cycle Reg
            vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
            vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")
            vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)")

            -- More KEyhs | some big `P` or small `p` are hard to recongnise
            vim.keymap.set("n", "]p", "<Plug>(YankyPutIndentAfterLinewise)")
            vim.keymap.set("n", "[p", "<Plug>(YankyPutIndentBeforeLinewise)")
            vim.keymap.set("n", "]P", "<Plug>(YankyPutIndentAfterLinewise)")
            vim.keymap.set("n", "[P", "<Plug>(YankyPutIndentBeforeLinewise)")

            vim.keymap.set("n", ">p", "<Plug>(YankyPutIndentAfterShiftRight)")
            vim.keymap.set("n", "<p", "<Plug>(YankyPutIndentAfterShiftLeft)")
            vim.keymap.set("n", ">P", "<Plug>(YankyPutIndentBeforeShiftRight)")
            vim.keymap.set("n", "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)")

            vim.keymap.set("n", "=p", "<Plug>(YankyPutAfterFilter)")
            vim.keymap.set("n", "=P", "<Plug>(YankyPutBeforeFilter)")

            -- HIGHLIGHTS
            vim.api.nvim_command("highlight YankyPut    guibg=#403d52 guifg=#eb6f92   ")
            vim.api.nvim_command("highlight YankyYanked guibg=#797593 guifg=#d7827e      ")

            -- -- Combinign with Telesocpe 🔭
            -- require("telescope").load_extension("yank_history")
        end,
    },
}
