return {
    "martineausimon/nvim-bard",
    dependencies = "MunifTanjim/nui.nvim", -- only for "popup" mode
    keys = "<leader>b",
    config = function()
        require("nvim-bard").setup({
            bard_api_key = "", --required
            display_mode = "vsplit", -- "popup", "vsplit" or "tabnew"
            mappings = {
                toggle_bard = "<leader>b",
                hide_bard = { "q", "<esc>" },
                send_bard = "<cr>",
                new_chat = "<c-n>",
            },
            options = {
                ui = {
                    question = {
                        signs = {
                            sign = "",
                            hi = "Function",
                            style = "rounded", -- "double", "none", "rounded", "solid"
                        },
                        border = { -- only for "popup" mode
                            style = "single", -- "double", "none", "shadow", "rounded", "solid"
                            text = {
                                top = "[Prompt]",
                            },
                        },
                    },
                    bard = {
                        signs = {
                            sign = "🟆",
                            hi = "Statement",
                            style = "single",
                        },
                        border = {
                            style = "single",
                            text = {
                                top = "[Bard]",
                            },
                        },
                    },
                },
                buffer_options = {
                    signcolumn = "yes:1",
                    filetype = "markdown",
                    conceallevel = 3,
                    buftype = "nofile",
                },
            },
        })
    end,
}
