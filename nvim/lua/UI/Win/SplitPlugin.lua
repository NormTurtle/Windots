M = {

    { -- Tmux 's panes
        "mrjones2014/smart-splits.nvim", -- super powerful Re sizer,swaper, panes
        keys = { "<C-w>", "<C-k>", "<C-j>", "<C-l>", "C-h", "<leader>z" },
        -- event = "WinNew",
        dependencies = {
            { "nvimtools/hydra.nvim" },
            { "sindrets/winshift.nvim" },
            -- { "romgrk/barbar.nvim" },
            { "jlanzarotta/bufexplorer" },
            { "anuvyklack/windows.nvim", dependencies = "anuvyklack/middleclass" },
        },
    },
}
return M
