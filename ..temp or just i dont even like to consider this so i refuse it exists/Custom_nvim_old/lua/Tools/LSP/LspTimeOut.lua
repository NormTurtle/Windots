--         ╭──────────────────────────────────────────────────────────╮
--         │                 SAve Ram usage form lsp                  │
--         ╰──────────────────────────────────────────────────────────╯

M = {

    {
        "hinell/lsp-timeout.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        event = "LspAttach",
        init = function()
            vim.g.lspTimeoutConfig = {
                stopTimeout = 1000 * 60 * 5, -- ms, timeout before stopping all LSPs
                startTimeout = 1000 * 10, -- ms, timeout before restart
                silent = false, -- true to suppress notifications
                filetypes = {
                    ignore = { -- filetypes to ignore; empty by default
                        -- lsp-timeout is disabled completely for these filetypes
                    },
                },
            }
        end,
    },
}
return M
