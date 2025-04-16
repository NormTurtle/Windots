M = {

    { -- Hydra
        "nvimtools/hydra.nvim",
        keys = { "<C-w>", "<Leader>ve", "<Leader>va" },
        config = function()
            require("UI.Win.VennHydra")
            require("UI.Win.WindowMananger")
            require("Tools.Comment.Venn")
        end,
    },
}
return M
