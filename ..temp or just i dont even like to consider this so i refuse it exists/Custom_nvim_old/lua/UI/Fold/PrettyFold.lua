M = {

    -- ╭──────────────────────╮
    -- │ FOld Ui modificatoin │
    -- ╰──────────────────────╯
    {
        "anuvyklack/pretty-fold.nvim",
        event = "BufReadPost",
        config = function()
            require("pretty-fold").setup({
                keep_indentation = false,
                -- fill_char = '━',
                fill_char = "⋅",
                sections = {
                    left = {
                        "━ ",
                        function()
                            return string.rep("*", vim.v.foldlevel)
                        end,
                        " ━┫",
                        "content",
                        "┣",
                    },
                    right = {
                        "┫ ",
                        "number_of_folded_lines",
                        ": ",
                        "percentage",
                        " ┣━━",
                    },
                },
            })
            -- for C++ only
            require("pretty-fold").ft_setup("cpp", {
                process_comment_signs = false,
                comment_signs = {
                    "/**", -- C++ Doxygen comments
                },
                stop_words = {
                    -- ╟─ "*" ──╭───────╮── "@brief" ──╭───────╮──╢
                    --          ╰─ WSP ─╯              ╰─ WSP ─╯
                    "%*%s*@brief%s*",
                },
            })
        end,
    },
}
return M
