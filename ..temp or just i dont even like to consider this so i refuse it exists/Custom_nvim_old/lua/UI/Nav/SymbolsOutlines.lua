--         ╭──────────────────────────────────────────────────────────╮
--         │               symbols like tree using lsp                │
--         ╰──────────────────────────────────────────────────────────╯
M = {
    {
        "hedyhli/symbols-outline.nvim",
        cmd = { "SymbolsOutline", "SymbolsOutlineOpen" },
        keys = { { "<leader>tt", "<cmd>SymbolsOutline<CR>", desc = "Toggle outline" } },
        opts = {
            highlight_hovered_item = true,
            show_guides = true,
            auto_preview = true,
            position = "right",
            relative_width = true,
            width = 25,
            auto_close = true,
            show_symbol_details = true,
            auto_unfold_hover = true,
            fold_markers = { "", "" },
            wrap = true,
            keymaps = { -- These keymaps can be a string or a table for multiple keys
                close = { "<Esc>", "q" },
                goto_location = "<Cr>",
                focus_location = "o",
                hover_symbol = "<C-space>",
                toggle_preview = "K",
                rename_symbol = "r",
                code_actions = "a",
                fold = "h",
                unfold = "l",
                fold_all = "W",
                unfold_all = "E",
                fold_reset = "R",
            },
        },
    },
}
return M
