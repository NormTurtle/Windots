--         ╭──────────────────────────────────────────────────────────╮
--         │           SEACH faster in normal mode by Folke           │
--         ╰──────────────────────────────────────────────────────────╯
-- @note jump to first search with <cr>
M = {
    {
        "folke/flash.nvim",
        -- event = "VeryLazy",
        opts = {
            search = {
                -- Each mode will take ignorecase and smartcase into account.
                -- * exact: exact match
                -- * search: regular search
                -- * fuzzy: fuzzy search
                mode = "fuzzy",
                -- behave like `incsearch`
                incremental = true,
                exclude = {
                    "notify",
                    "cmp_menu",
                    "noice",
                    "flash_prompt",
                    function(win)
                        -- exclude non-focusable windows
                        return not vim.api.nvim_win_get_config(win).focusable
                    end,
                },
            },
            jump = { autojump = true },
            label = {
                -- allow uppercase labels
                uppercase = false,
                -- show the label after the match
                after = false, ---@type boolean|number[]
                -- show the label before the match
                before = true, ---@type boolean|number[]
                -- position of the label extmark
                style = "inline", ---@type "eol" | "overlay" | "right_align" | "inline"
                -- Enable this to use rainbow colors to highlight labels
                -- Can be useful for visualizing Treesitter ranges.
                rainbow = {
                    enabled = false,
                    -- number between 1 and 9
                    shade = 5,
                },
            },
            modes = {
                -- a regular search with `/` or `?`
                search = {
                    enabled = true,
                    highlight = { backdrop = true },
                    jump = { history = true, register = true, nohlsearch = false },
                },
                -- options used when flash is activated through
                -- `f`, `F`, `t`, `T`, `;` and `,` motions
                char = {
                    enabled = true,
                    -- dynamic configuration for ftFT motions
                    jump_labels = true,
                },
            },
        },
        -- stylua: ignore
        keys = {
            { "f", "F", "t", "T", ";", "," },
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash", },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter", },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash", },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search", },
        },
    },
}
return M
