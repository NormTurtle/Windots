--         ╭──────────────────────────────────────────────────────────╮
--         │                         NONE-ls                          │
--         ╰──────────────────────────────────────────────────────────╯
M = {

 {
         "nvimtools/none-ls.nvim",
 dependencies = "nvim-lua/plenary.nvim",

 config = function ()
local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
    },
})
         -- Format on Save
         local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                    vim.lsp.buf.formatting_sync()
                end,
            })
        end
    end,
})
 end,

}


}
return  M
