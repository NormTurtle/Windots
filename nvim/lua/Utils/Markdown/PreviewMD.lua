--  ╭──────────────────────────────────────────────────────────╮
--  │ Preview Markdown                                         │
--  ╰──────────────────────────────────────────────────────────╯
M = {

    { -- Previewr
        {
            "ellisonleao/glow.nvim",
            opts = {
                -- border = "shadow", -- floating window border config
                -- width = 140,
                -- height = 80,
                -- width_ratio = 0.9, -- maximum width of the Glow window compared to the nvim window size (overrides `width`)
                -- height_ratio = 0.9,
            },
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
