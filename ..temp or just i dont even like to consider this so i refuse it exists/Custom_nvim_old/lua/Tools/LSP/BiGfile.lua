-- Edit fastly big files
-- remove syntax , lsp, extra stuff
return {
    {
        "LunarVim/bigfile.nvim",
        event = "BufReadPre",
        opts = true,
    },
}
