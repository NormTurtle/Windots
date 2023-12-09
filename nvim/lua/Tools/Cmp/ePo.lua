return {
    "nvimdev/epo.nvim",
    config = function()
        require("epo").setup({
            -- default value of options.
            fuzzy = true,
            -- increase this value can aviod trigger complete when delete character.
            debounce = 50,
            -- when completion confrim auto show a signature help floating window.
            signature = true,
        })
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
    end,
}
