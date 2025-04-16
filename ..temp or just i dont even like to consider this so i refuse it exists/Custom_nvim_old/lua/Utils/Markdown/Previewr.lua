--  ╭──────────────────────────────────────────────────────────╮
--  │ Preview Markdown                                         │
--  ╰──────────────────────────────────────────────────────────╯
M = {

    { -- Previewr
        {
            "ellisonleao/glow.nvim",
            config = true,
            cmd = "Glow",
        },
        {
            "iamcco/markdown-preview.nvim",
            ft = "markdown",
            lazy = true,
            build = "cd app && npm install && git reset --hard",
        },
    },
}
return M
