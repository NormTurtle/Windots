--         ╭──────────────────────────────────────────────────────────╮
--         │                      UNDO HIGHLIGHT                      │
--         ╰──────────────────────────────────────────────────────────╯

M = {

    { -- Undo highlight
        "tzachar/highlight-undo.nvim",
        keys = { "u", "U", "C-r" },
        config = function()
            require("highlight-undo").setup({
                duration = 300,
                undo = {
                    hlgroup = "DiffAdd",
                    mode = "n",
                    lhs = "u",
                    map = "undo",
                    opts = {},
                },
                redo = {
                    hlgroup = "DiffDelete",
                    mode = "n",
                    lhs = "<C-r>",
                    map = "redo",
                    opts = {},
                },
                highlight_for_count = true,
            })
        end,
    },
}
return M
