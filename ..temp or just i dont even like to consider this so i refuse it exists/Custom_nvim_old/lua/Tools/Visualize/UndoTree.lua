-- Visualize undoing file
return {
    {
        "jiaoshijie/undotree",
        keys = "<leader>u",
        config = function()
            vim.keymap.set("n", "<leader>u", require("undotree").toggle, { noremap = true, silent = true })
            require("undotree").setup({
                float_diff = true, -- using float window previews diff, set this `true` will disable layout option
                layout = "left_bottom", -- "left_bottom", "left_left_bottom"
                window = { winblend = 28, width = 25 },
            })
        end,
        dependencies = { "nvim-lua/plenary.nvim" },
    },
}
