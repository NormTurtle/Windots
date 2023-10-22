return {

    { -- gcc bruh
        "numToStr/Comment.nvim",
        keys = {
            { "gc", mode = { "n", "v" }, desc = "Comment motion wise or gcc for line" },
            { "gb", mode = { "n", "v" }, desc = "commnet block wise" },
            { "gcO", mode = { "n", "v" }, desc = "commnet above line" },
            { "gco", mode = { "n", "v" }, desc = "commnet below line" },
            { "gcA", mode = { "n", "v" }, desc = "commnet at the end of line" },
        },
        -- event = "BufReadPost",
        opts = {},
    }, -- >,< do not change position
}
