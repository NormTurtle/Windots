return {
    "nvimdev/epo.nvim",
    config = function()
        -- suggested completeopt
        vim.opt.completeopt = "menu,menuone,noselect"
        -- default settings
        require("epo").setup({
            -- fuzzy match
            fuzzy = true,
            -- increase this value can aviod trigger complete when delete character.
            debounce = 50,
            -- when completion confrim auto show a signature help floating window.
            signature = true,
            -- vscode style json snippet path
            snippet_path = nil,
            -- border for lsp signature popup, :h nvim_open_win
            signature_border = "rounded",
            -- lsp kind formatting, k is kind string "Field", "Struct", "Keyword" etc.
            kind_format = function(k)
                return k:lower():sub(1, 1)
            end,
        })

        local capabilities =
            vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), require("epo").register_cap())
        vim.keymap.set("i", "<TAB>", function()
            if vim.fn.pumvisible() == 1 then
                return "<C-n>"
            elseif vim.snippet.jumpable(1) then
                return "<cmd>lua vim.snippet.jump(1)<cr>"
            else
                return "<TAB>"
            end
        end, { expr = true })

        vim.keymap.set("i", "<S-TAB>", function()
            if vim.fn.pumvisible() == 1 then
                return "<C-p>"
            elseif vim.snippet.jumpable(-1) then
                return "<cmd>lua vim.snippet.jump(-1)<CR>"
            else
                return "<S-TAB>"
            end
        end, { expr = true })

        vim.keymap.set("i", "<C-e>", function()
            if vim.fn.pumvisible() == 1 then
                require("epo").disable_trigger()
            end
            return "<C-e>"
        end, { expr = true })
        ------
        -- For using enter as completion, may conflict with some autopair plugin
        vim.keymap.set("i", "<cr>", function()
            if vim.fn.pumvisible() == 1 then
                return "<C-y>"
            end
            return "<cr>"
        end, { expr = true, noremap = true })

        -- nvim-autopair compatibility
        vim.keymap.set("i", "<cr>", function()
            if vim.fn.pumvisible() == 1 then
                return "<C-y>"
            end
            return require("nvim-autopairs").autopairs_cr()
        end, { expr = true, noremap = true })
    end,
}
