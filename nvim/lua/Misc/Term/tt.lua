return {
    {
        "distek/tt.nvim",
        config = function()
            require("tt").setup({
                focus_on_select = false,
                termlist = {
                    enabled = true,
                    side = "right",
                    width = 25,
                },
                winbar = {
                    tabs = true,
                    list = true,
                },

                fixed_height = false,
                fixed_width = false, -- handled by edgy
                height = 15,
            })
        end,
    },
}
