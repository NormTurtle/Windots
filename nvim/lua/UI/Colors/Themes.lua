return {
    -- -- Themes Mangager
    -- { 'zaldih/themery.nvim',
    --   cmd = "Themery",
    --   -- config = function() require('tsst') end
    -- },

    --Theme
    -- { -- inspired of gruv+dracula
    --   "rebelot/kanagawa.nvim",
    --   event = "ColorScheme",
    -- },
    {
        "projekt0n/caret.nvim",
        enabled = false,
    },
    {
        "baliestri/aura-theme",
        enabled = false,
        lazy = false,
        priority = 1000,
    },
    -- {
    --   "folke/tokyonight.nvim",
    --   -- lazy = false,
    --   -- priority = 1000,
    --   opts = {},
    -- },
    -- "Yazeed1s/oh-lucy.nvim",
    -- 'kyazdani42/blue-moon',
    -- 'voidekh/kyotonight.vim',
    -- { 'catppuccin/nvim', name = "catppuccin",},
    {
        "rose-pine/neovim",
        name = "rose-pine",

        event = "ColorScheme",
    },
    -- { "kyazdani42/blue-moon" }, -- hurt blule eye
    -- "dotsilas/darcubox-nvim",
    -- -- My Beloved dark somber,stern shit
    -- 'huyvohcmc/atlas.vim', -- very minimal no code highlight 🗿
    -- "ntk148v/komau.vim", -- a Chocolatel like color scheme
    -- 'nikolvs/vim-sunbather', -- pink monochorome colorscheme
    -- { "jesseleite/nvim-noirbuddy", dependencies = { "tjdevries/colorbuddy.nvim", branch = "dev" } }, -- hot pink
}
