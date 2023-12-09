-- Better escape for Terminal and Cmdline and instert mode , all most all mode
M = {

    {
        "TheBlob42/houdini.nvim",
        event = { "InsertEnter" },
        keys = { ":" },
        opts = {
            mappings = { "jk" },
            timeout = vim.o.timeoutlen,
            check_modified = true,
            escape_sequences = {
                ["i"] = "<BS><BS><ESC>",
                ["ic"] = "<BS><BS><ESC>",
                ["ix"] = "<BS><BS><ESC>",
                ["R"] = "<BS><BS><ESC>",
                ["Rc"] = "<BS><BS><ESC>",
                ["Rx"] = "<BS><BS><ESC>",
                ["Rv"] = "<BS><BS><ESC>",
                ["Rvc"] = "<BS><BS><ESC>",
                ["Rvx"] = "<BS><BS><ESC>",
                ["r"] = "<ESC>",
                ["rm"] = "<ESC>",
                ["t"] = "<BS><BS><C-\\><C-n>",
                ["c"] = "<BS><BS><C-c>",
                ["cv"] = ("<BS>"):rep(100) .. "vi<CR>",
            },
        },
    },
}

return M
