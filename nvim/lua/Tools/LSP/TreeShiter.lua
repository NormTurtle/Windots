return {

    { -- Treesitter
        -- YOU ALMOST CERTAINLY WANT A MORE ROBUST nvim-treesitter SETUP
        -- see https://github.com/nvim-treesitter/nvim-treesitter
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "InsertEnter" },
        dependencies = {
            -- "HiPhish/rainbow-delimiters.nvim",
            -- "nvim-treesitter/nvim-treesitter-textobjects",
            -- "JoosepAlviste/nvim-ts-context-commentstring",
        },
        opts = {
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
}
