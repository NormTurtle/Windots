return
	{
    -- -- Themes Mangager
    -- { 'zaldih/themery.nvim',
    --   cmd = "Themery",
    --   -- config = function() require('tsst') end
    -- },

    --Theme
		-- 'rebelot/kanagawa.nvim', -- inspired of gruv+dracula
    {"techtuner/aura-neovim", -- aura theme
      event = 'ColorScheme',
    },

		-- 'kyazdani42/blue-moon',
		-- 'voidekh/kyotonight.vim',
		-- { 'catppuccin/nvim', name = "catppuccin",},
		{ "rose-pine/neovim", name = "rose-pine" },
		-- -- My Beloved dark somber,stern shit
		-- 'huyvohcmc/atlas.vim', -- very minimal no code highlight 🗿
		-- "ntk148v/komau.vim", -- a Chocolatel like color scheme
		-- 'nikolvs/vim-sunbather', -- pink monochorome colorscheme
		-- { "jesseleite/nvim-noirbuddy", dependencies = { "tjdevries/colorbuddy.nvim", branch = "dev" } }, -- hot pink
	}

	-- {
	--   Default theme if no applied
	--   'kyazdani42/blue-moon',
	--   version = false,
	--   lazy = false,
	--   priority = 1000,
	--   make sure to load this before all the other start plugins config = function() require("blue-moon").setup()end,
	-- },
