--         ╭──────────────────────────────────────────────────────────╮
--         │                           UFO                            │
--         ╰──────────────────────────────────────────────────────────╯
M = {

    -- { -- H, L key for fold open,close
    --   "chrisgrieser/nvim-origami",
    --   event = "LspAttach",
    --   -- event = "BufReadPost", -- later or on keypress would prevent saving folds
    --   opts = true, -- needed even when using default config
    -- },
    --  ╭────────────────╮
    --  │ UFO not in sky │
    --  ╰────────────────╯

    {
        "kevinhwang91/nvim-ufo",
        event = "BufReadPost", -- later or on keypress would prevent saving folds
        dependencies = {
            "kevinhwang91/promise-async",
            -- "chrisgrieser/nvim-origami", -- h,l as fold open/close
            -- "jghauser/fold-cycle.nvim", -- cycle with TAB or s-tab
            -- "anuvyklack/pretty-fold.nvim", -- Ui modification
            {
                "luukvbaal/statuscol.nvim",
                config = function()
                    local builtin = require("statuscol.builtin")
                    require("statuscol").setup({
                        relculright = true,
                        segments = {
                            { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
                            { text = { "%s" }, click = "v:lua.ScSa" },
                            { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
                        },
                    })
                end,
            },
        },
        event = "BufReadPost", -- later or on keypress would prevent saving folds
        opts = true, -- needed even when using default config
        config = function()
            -- Option 2: nvim lsp as LSP client
            -- Tell the server the capability of foldingRange,
            -- Neovim hasn't added foldingRange to default capabilities, users must add it manually
            -- local capabilities = vim.lsp.protocol.make_client_capabilities()
            -- capabilities.textDocument.foldingRange = {
            --     dynamicRegistration = false,
            --     lineFoldingOnly = true,
            -- }
            -- local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
            -- for _, ls in ipairs(language_servers) do
            --     require("lspconfig")[ls].setup({
            --         capabilities = capabilities,
            --         -- you can add other fields for setting up lsp server in this table
            --     })
            -- end
            -- require("ufo").setup()
            require("ufo").setup({
                open_fold_hl_timeout = 150,
                close_fold_kinds = { "imports", "comment" },
                preview = {
                    win_config = {
                        border = { "", "─", "", "", "", "─", "", "" },
                        winhighlight = "Normal:Folded",
                        winblend = 0,
                    },
                    mappings = {
                        scrollU = "<C-u>",
                        scrollD = "<C-d>",
                        jumpTop = "[",
                        jumpBot = "]",
                    },
                },
            })

            vim.o.foldenable = true -- enable fold for nvim-ufo
            vim.o.foldlevel = 99 -- set high foldlevel for nvim-ufo
            vim.o.foldlevelstart = 99 -- start with all code unfolded
            vim.o.foldcolumn = "1" -- '0' is not bad
            vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
            --
            --   -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
            --   -- vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
            --   -- vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
            --   -- Improved Code Folding
            --   vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
            --   vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
            --   vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds, { desc = "Fold less" })
            --   vim.keymap.set("n", "zm", require("ufo").closeFoldsWith, { desc = "Fold more" })
            --   vim.keymap.set("n", "zp", require("ufo").peekFoldedLinesUnderCursor, { desc = "Peek fold" })
            --   vim.keymap.set("n", "K", function()
            --     local winid = require("ufo").peekFoldedLinesUnderCursor()
            --     if not winid then
            --       -- choose one of coc.nvim and nvim lsp
            --       vim.fn.CocActionAsync("definitionHover") -- coc.nvim
            --       vim.lsp.buf.hover()
            --     end
            --   end)
            --   -- Again with <TABS>
            --   vim.keymap.set("n", "<Tab>", require("ufo").openAllFolds)
            --   vim.keymap.set("n", "<S-Tab>", require("ufo").closeAllFolds)
        end,
        --
        -- -- Option 3: treesitter as a main provider instead
        -- -- Only depend on `nvim-treesitter/queries/filetype/folds.scm`,
        -- -- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
        -- -- " hi default UfoFoldedFg guifg=Normal.foreground
        -- -- " hi default UfoFoldedBg guibg=Folded.background
        -- -- vim.api.nvim_command('highlight Normal guibg=transparent ctermbg=none')
    },
}
return M
