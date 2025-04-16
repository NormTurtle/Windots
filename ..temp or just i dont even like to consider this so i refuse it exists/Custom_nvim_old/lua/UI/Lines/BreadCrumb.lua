-- IDE-like breadcrumbs
return {
    { -- Winbar on Top
        "Bekaboo/dropbar.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "BufReadPost",
        config = function()
            vim.opt.mousemoveevent = true
        end,
    },
}
