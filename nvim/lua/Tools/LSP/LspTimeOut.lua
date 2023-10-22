--         ╭──────────────────────────────────────────────────────────╮
--         │                 SAve Ram usage form lsp                  │
--         ╰──────────────────────────────────────────────────────────╯

M = {

    {
        "hinell/lsp-timeout.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        event = "LspAttach",
        init = function()
            vim.g["lsp-timeout-config"] = {
                stopTimeout = 1000 * 60 * 5, -- ms, timeout before stopping all LSP servers
                startTimeout = 1000 * 10, -- ms, timeout before restart
                silent = false, -- true to suppress notifications
            }
        end,
    },
}

return M
