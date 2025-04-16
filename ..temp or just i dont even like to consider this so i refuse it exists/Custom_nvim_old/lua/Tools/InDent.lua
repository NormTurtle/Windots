--  ╭─────────────────────╮
--  │ lines for no reason │
--  ╰─────────────────────╯
M = {

    { -- visual Indent
        "echasnovski/mini.indentscope",
        -- event = "VeryLazy",
        event = "BufReadPre",
        config = function()
            require("mini.indentscope").setup({ symbol = "│" })
        end,
    },
}
return M
