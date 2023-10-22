M = {

    { -- Hydra
        "anuvyklack/hydra.nvim",
        keys = { "<C-w>", "<Leader>ve" },
        config = function()
            require("UI.Win.VennHydra")
            require("UI.Win.WindowMananger")
        end,
    },
}
return M
