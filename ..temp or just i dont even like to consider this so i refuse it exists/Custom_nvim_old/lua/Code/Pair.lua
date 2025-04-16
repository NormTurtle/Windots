local M = {

    { -- Brackts, Parent, quotes, Completion
        "altermo/ultimate-autopair.nvim",
        branch = "v0.6",
        event = {
            "InsertEnter",--[[  "CmdlineEnter"  ]]
        },
        keys = { ":" },
        config = function()
            require("ultimate-autopair").setup({})
        end,
    },
}

return M
