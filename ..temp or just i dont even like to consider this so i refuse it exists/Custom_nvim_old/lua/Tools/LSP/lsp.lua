-- Ease Lsp set up
M = {
    -- this is pure magic, i love this guy
    -- lsp in floating winodow https://github.com/max397574/dyn_help.nvim
    -- for Lint https://github.com/mfussenegger/nvim-lint
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        event = "BufReadPre",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" }, -- Required
            { "williamboman/mason.nvim" }, -- Optional
            { "williamboman/mason-lspconfig.nvim" }, -- Optional
        },
        config = function()
            local lsp_zero = require("lsp-zero")
            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({
                    buffer = bufnr,
                    exclude = { "gl", "K" },
                })
            end)

            require("mason").setup({})
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls", -- lua lsp
                    -- "jsonls", -- Json
                    -- "jq", -- Json Formate
                    "taplo", --  Toml
                    -- "marksman", -- markdown
                },
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require("lspconfig").lua_ls.setup(lua_opts)
                    end,
                },
            })
            -- Icons
            local signs = { Error = "🤬", Warn = "🖐️", Hint = "☝️", Info = "🤓" }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end
        end,
    },

    -- { -- Ui Lsp
    -- 	"https://git.sr.ht/~whynothugo/lsp_lines.nvim", -- lines of Lsp
    -- 	event = "BufReadPost",
    -- 	config = function()
    -- 		require("lsp_lines").setup()
    -- 		vim.diagnostic.config({ virtual_lines = { only_current_line = true } })
    -- 	end,
    -- },
    -- some lsp ui
    {
        "j-hui/fidget.nvim",
        event = { "LspAttach" },
        opts = {},
    },
}
return M
