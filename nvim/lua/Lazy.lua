-- 1st line
-- https://github.com/topaxi/gh-actions.nvim
-- https://github.com/tiagovla/scope.nvim -- session with buffline
-- https://github.com/folke/persistence.nvim
--https://github.com/ray-x/web-tools.nvim -- we devlopement , html , javascript , curl
--https://github.com/chrisgrieser/nvim-alt-substitute
-- https://github.com/barrett-ruth/live-server.nvim
--https://github.com/chrisgrieser/nvim-early-retirement
-- note taking
--https://github.com/IlyasYOY/obs.nvim
--https://github.com/epwalsh/obsidian.nvim
--https://github.com/preservim/vim-markdown
--https://github.com/rareitems/anki.nvim
-- https://github.com/Dhanus3133/Leetbuddy.nvim -- leetcode in neovim
-- python
--https://github.com/GCBallesteros/NotebookNavigator.nvim  -- ipynb
-- Terminal
--https://github.com/niuiic/remote.nvim   -- edit file from ssh no dependencies
--https://github.com/mikesmithgh/kitty-scrollback.nvim
--https://github.com/dagle/galorehttps://github.com/dagle/galore  mail
-- vim.g.sqlite_clib_path = "C:\\Users\\O_0\\.local\\sqlite\\sqlite3.dll" -- set up sqlite path
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

    --         ╭──────────────────────────────────────────────────────────╮
    --         │                     UI, Ux for NVIM                      │
    --         ╰──────────────────────────────────────────────────────────╯
    --  ╭─────────────────╮
    --  │ Themes | Colors │
    --  ╰─────────────────╯
    { import = "UI.Colors.Themes" }, -- Rosepine | Aura | oh-lucy | kanagawa | blue-moon | tokyonight
    --  ╭───────────────────────────────╮
    --  │ Statusline | Tabline | &Lines │
    --  ╰───────────────────────────────╯
    -- { import = "UI.Lines.Lualine" }, -- normal lualine
    { import = "UI.Lines.LualineEvil" },
    -- { import = "UI.Lines.InCline" },
    --  ╭────────────────────────╮
    --  │  Navigation | Movement │
    --  ╰────────────────────────╯
    -- { import = "UI.Nav.BtrEsc" }, -- Better escape(jk)
    { import = "UI.Nav.Houdini" }, -- Houdini , Also Better escape(jk)
    { import = "UI.Nav.MoveMini" }, --  "<A-k>", "<A-j>", "<A-l", "<A-h"
    { import = "UI.Nav.WildFire" }, -- Increment selection with <cr>
    { import = "UI.Nav.Spider" }, -- change movement w W e E ge
    -- { import = "UI.Nav.Nword" },   --  more versatile n(ext) key  not workign niga
    { import = "UI.Nav.Flash" }, -- Flash.floke to (s)earch in in normal mode
    -- { import = "UI.Nav.Ftline" }, -- (F,t,f,T) key better search
    { import = "UI.Nav.SymbolsOutlines" }, -- tree view with lsp symbols
    --         ╭──────────────────────────────────────────────────────────╮
    --         │               Split and Window Managemenet               │
    --         ╰──────────────────────────────────────────────────────────╯
    { import = "UI.Win.SplitPlugin" }, -- Tmux like window managemenet
    { import = "UI.Win.Hydra" }, -- Which like suggestion
    --  ╭──────────────────────────────────────────────────────╮
    --  │ Cmdline | Wilder | Search | Floating help | hlsearch │
    --  ╰──────────────────────────────────────────────────────╯
    { import = "UI.Cmdline.Plugs" },
    --  ╭────────────╮
    --  │ Fold | UFO │
    --  ╰────────────╯
    { import = "UI.Fold.UF0" }, -- Ufo not in the sky
    -- { import = "UI.Fold.PrettyFold" }, -- Ui modification | now vim buitin
    -- { import = "UI.Fold.TabFold" }, -- Ui modification
    --  ╭─────────────────╮
    --  │ Themes | Colors │
    --  ╰─────────────────╯
    -- { import = "UI.Colors.Themes" }, -- Rosepine | Aura | oh-lucy | kanagawa | blue-moon | tokyonight
    --         ╭──────────────────────────────────────────────────────────╮
    --         │                          Notes                           │
    --         ╰──────────────────────────────────────────────────────────╯

    -- { import = "Edit.Note" },
    { import = "Utils.Notes.Neorg" },
    --if using NEORG  https://github.com/pysan3/Norg-Tutorial
    --         ╭──────────────────────────────────────────────────────────╮
    --         │                          Tools                           │
    --         ╰──────────────────────────────────────────────────────────╯
    --  ╭─────────╮
    --  │  LSP    │
    --  ╰─────────╯
    { import = "Tools.LSP.Lsp" }, -- lsp.zero
    { import = "Tools.LSP.LspTimeOut" }, -- save Ram from lsp
    { import = "Tools.Cmp.Cmp_0" }, -- Completion
    { import = "Tools.Cmp.Tabout" }, -- Completion
    --  ╭─────────╮
    --  │ NULL.ls │
    --  ╰─────────╯
    -- { import = "Tools.LSP.NullLs" }, -- set of language server
    -- i droped to configure it because im lazy
    --  ╭───────────╮
    --  │ Formatter │
    --  ╰───────────╯
    { import = "Tools.Formater.conform" }, -- conform a buggy formater
    -- { import = "Tools.Formater.4mater" }, -- Fomatter.nvim
    -- { import = "Tools.Fundo" }, -- store undo changes for long
    { import = "Tools.Formater.Align" }, -- Text alignments

    --  ╭────────────────╮
    --  │  Commenting    │
    --  ╰────────────────╯
    -- { import = "Tools.Comment.Mini" }, -- mini.cooment
    { import = "Tools.Comment.numToStr" }, -- gcc,gcn versitile commentj
    { import = "Tools.Comment.BoxS" }, -- Beautify commenting boxes
    { import = "Tools.Comment.Venn" }, -- Cool Ascii draw
    --  ╭───────────╮
    --  │ Telescope │
    --  ╰───────────╯
    { import = "Tools.Tscope" }, -- Telescope | FUzzy finder
    --  ╭────────╮
    --  │ Indent │
    --  ╰────────╯
    { import = "Tools.InDent" }, -- Mini Indentscope
    --  ╭──────────╮
    --  │ WhichKey │
    --  ╰──────────╯
    -- { import = "Tools.WhichKey.WF" }, -- WF | whichkey
    -- { import = "Tools.WhichKey.Clue" },
    -- { import = "Tools.WhichKey.WhichKey" },
    --  ╭───────────────╮
    --  │ SpecialSearch │
    --  ╰───────────────╯
    { import = "Tools.SsrSearch" }, -- TS basesd search
    --  ╭───────────────────────────────╮
    --  │  Editing | Autopair | Tabout  │
    --  ╰───────────────────────────────╯
    { import = "Code.Pair" }, -- Brackts, Parent, quotes, Completion, ultimate-autopair.
    --  ╭──────────╮
    --  │ Terminal │
    --  ╰──────────╯
    -- { import = "Misc.Term", }, -- plugin for terminal but dint workk
    --  ╭──────╮
    --  │ Misc │
    --  ╰──────╯
    -- { import = "Misc.DataSc.DataViewCSV", }, -- view csv,tsv DATAVIEW
    --  ╭──────────────────────────╮
    --  │ File manager | Sfm | Oil │
    --  ╰──────────────────────────╯
    { import = "Fm.Sfm" }, -- (Simple) File Manager
    { import = "Fm.Oil" }, -- O(il)
    --  ╭──────────╮
    --  │ Markdown │
    --  ╰──────────╯
    -- { import = "Utils.Markdown" },
    { import = "Utils.Markdown.Previewr" },
    --  ╭─────╮
    --  │ Git │
    --  ╰─────╯
    { import = "Code.Git.Diffview" },
    { import = "Code.Git.GitSigns" },
    { import = "Code.Git.Lazygit" },
    -- { import = "Code.Git.Magit" },

    --  ╭─────────────────────────╮
    --  │ Ai | Bard | GPT CoPilot │
    --  ╰─────────────────────────╯
    -- { import = "Misc.AI.Bard" },
    { import = "Misc.AI.LLm" }, -- PALM 2 api
    -- { import = "Misc.AI.Codeium" },

    --  ╭───────────────────────────────────────╮
    --  │  Registers | Yank,Yanky Paste | GPT   │
    --  ╰───────────────────────────────────────╯
    { import = "Code.Reg.Reg" }, -- " Registers in a window
    { import = "Code.Reg.Ypaste" }, --- ADD highlight to paste and yank
    { import = "Code.Reg.UndoHIgh" }, -- ADD highlight to Undo `u` key

    -- Apearance

    { -- Start ify cow
        "mhinz/vim-startify",
        lazy = false,
        init = function()
            require("Misc.Startify")
            vim.keymap.set({ "n" }, "<leader>;", "<Cmd>Startify<Cr>", { desc = "spawn cow" })
        end,
    },

    { -- NoMove of corsor in '<,>,=' movements
        "gbprod/stay-in-place.nvim",
        event = "BufReadPre",
        config = function()
            require("stay-in-place").setup({})
        end,
    },

    { -- Winbar on Top
        "Bekaboo/dropbar.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "BufReadPost",
        config = function()
            vim.opt.mousemoveevent = true
        end,
    },

    -- Ui
    -- { -- Colored Sperator windows
    --     "nvim-zh/colorful-winsep.nvim",
    --     event = { "WinNew" },
    --     config = function()
    --         require("colorful-winsep").setup({
    --             -- highlight for Window separator
    --             -- highlight = {
    --             --   bg = "#1f1d2e", -- rose pine theme
    --             --   fg = "#eb6f92",
    --             -- },
    --             no_exec_files = {
    --                 "packer",
    --                 "SymbolsOutline",
    --                 "TelescopePrompt",
    --                 "mason",
    --                 "CompetiTest",
    --                 "NvimTree",
    --                 "sfm",
    --             },
    --             -- Symbols for separator lines, the order: horizontal, vertical, top left, top right, bottom left, bottom right.
    --             symbols = { "━", "┃", "┏", "┓", "┗", "┛" },
    --             -- close_event = function()
    --             --   -- Executed after closing the window separator
    --             -- end,
    --             -- create_event = function()
    --             --   -- Executed after creating the window separator
    --             -- end,
    --         })
    --     end,
    -- },

    -- { -- Dynamic relative, Numbers
    --   "sitiom/nvim-numbertoggle",
    --   event = "VeryLazy",
    -- },

    { -- Cursor line
        "yamatsum/nvim-cursorline",
        event = "BufReadPost",
        config = function()
            require("nvim-cursorline").setup({
                cursorline = { enable = true, timeout = 300, number = true },
                cursorword = { enable = false, min_length = 3, hl = { underline = false } },
            })
        end,
    },

    -- { -- Illuminate words
    --   "RRethy/vim-illuminate",
    --   event = "BufReadPost",
    --   config = function()
    --     require("illuminate").configure({
    --       providers = { "regex" },
    --       delay = 200,
    --       large_file_cutoff = 2000,
    --       large_file_overrides = { providers = { "lsp" } },
    --     })
    --     vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "lualine_a_inactive" })
    --     vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "lualine_a_inactive" })
    --     vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "lualine_a_inactive" })
    --     -- https://github.com/RRethy/vim-illuminate/issues/115#issuecomment-1221297926
    --   end,
    -- },

    -- Utility 's
    { -- Codebins 0x0
        "rktjmp/paperplanes.nvim",
        cmd = "PP",
    },

    { -- Last Location
        "ethanholz/nvim-lastplace",
        event = "BufReadPre",
        config = function()
            require("nvim-lastplace").setup({
                lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
                lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
                lastplace_open_folds = true,
            })
        end,
    },

    -- Markdown
    -- 'frabjous/knap', -- use it one linux
    -- { 'renerocksai/calendar-vim', -- some calender for wiki
    --   cmd = { "Calendar", "CalendarH", "CalendarT", "CalendarVR", "CalendarSearch", }, },
    --itchyny/calendar.vim
    {
        "itchyny/calendar.vim", -- Calendar with the coolest CLOCK view
        cmd = { "Calendar" },
    },
    -- Markdown Tool s'
    -- {
    -- 	"gaoDean/autolist.nvim", -- 🔥 powerfull autolist,checkbox toggle, full Markdown Weapon
    -- 	ft = {
    -- 		"markdown", --[[ "text",  ]]
    -- 		"tex",
    -- 		"plaintex",
    -- 	},
    --
    -- 	-- dependencies = "mzlogin/vim-markdown-toc", -- Markdown Toc
    --
    -- 	config = function()
    -- 		local autolist = require("autolist")
    -- 		autolist.setup()
    -- 		autolist.create_mapping_hook("i", "<CR>", autolist.new)
    -- 		autolist.create_mapping_hook("i", "<Tab>", autolist.indent)
    -- 		autolist.create_mapping_hook("i", "<S-Tab>", autolist.indent, "<C-D>")
    -- 		autolist.create_mapping_hook("n", "o", autolist.new)
    -- 		autolist.create_mapping_hook("n", "O", autolist.new_before)
    -- 		autolist.create_mapping_hook("n", ">>", autolist.indent)
    -- 		autolist.create_mapping_hook("n", "<<", autolist.indent)
    -- 		autolist.create_mapping_hook("n", "<C-r>", autolist.force_recalculate)
    -- 		autolist.create_mapping_hook("n", "<leader>x", autolist.invert_entry, "")
    -- 	end,
    -- },

    { -- auto-bullets for markdown-like filetypes
        "dkarter/bullets.vim",
        ft = "markdown",
        config = function()
            vim.g.bullets_delete_last_bullet_if_empty = 1
        end,
    },
    { -- Markdown Keys                     Only wors in Visual mode
        "antonk52/markdowny.nvim", -- <c-e> = code block , <c-k> = link , <c-i> = italic , <c-b> = bold ,
        ft = { "markdown", "txt", "md" },
        config = function()
            require("markdowny").setup()
        end,
    },

    --   { -- coool over 28 module for markdonw preview
    -- 'cnshsliu/smp.nvim',
    -- build ="cd lua/server && npm install",   -- yes, we should have node & npm installed.
    -- dependencies = {
    --   "nvim-telescope/telescope.nvim",
    --   "MunifTanjim/nui.nvim",
    --     },
    --     },
    { -- Bionic reader
        "HampusHauffman/bionic.nvim",
        cmd = "Bionic",
    },

    -- Code manipulation

    { -- Around Add/change/delete
        "kylechui/nvim-surround",
        -- should look into https://github.com/roobert/surround-ui.nvim
        keys = {
            { "ys", desc = "󰅪 Add Surround Operator" },
            { "yS", desc = "󰅪 Surround to EoL" },
            { "ds", desc = "󰅪 Delete Surround Operator" },
            { "cs", desc = "󰅪 Change Surround Operator" },
            { "s", mode = "x", desc = "󰅪 Add Surround Operator" },
        },
        config = function()
            require("nvim-surround").setup()
        end,
    },

    -- {  -- indent
    --    "lukas-reineke/indent-blankline.nvim",
    --   config = function ()
    --    vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
    --    vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]
    --    require("indent_blankline").setup {
    --     char = "│",
    --     char_highlight_list = {
    --       "IndentBlanklineIndent1",
    --       "IndentBlanklineIndent2",
    --      },
    --      space_char_highlight_list = {
    --       "IndentBlanklineIndent1",
    --       "IndentBlanklineIndent2", },
    --      show_trailing_blankline_indent = true, }
    --   end
    -- },

    { -- Highlight parethns
        "utilyre/sentiment.nvim",
        event = "VeryLazy",
        opts = true,
    },

    { -- Contidion switcher
        "nguyenvukhang/nvim-toggler",
        keys = { "<leader>i" },
        event = "BufReadPost",
        config = function()
            require("nvim-toggler").setup()
            vim.keymap.set({ "n", "v" }, "<leader>i", require("nvim-toggler").toggle)
        end,
    },

    { -- toggle things
        -- also see ['tandy1229/wordswitch.nvim']
        "nat-418/boole.nvim",
        keys = { "<C-a>" },
        config = function()
            require("boole").setup({
                mappings = {
                    increment = "<C-a>",
                    decrement = "<C-x>",
                    "<leader>i",
                },
                allow_caps_additions = {
                    { "enable", "disable" },
                },
            })
        end,
    },

    { -- UX
        -- https://github.com/nvim-colortils/colortils.nvim
        "NvChad/nvim-colorizer.lua",
        cmd = "PickColorInsert",
        ft = { "css", "scss", "markdown", "html", "config", "toml" },
        config = function()
            require("colorizer").setup({
                filetypes = { "*" },
                buftypes = {},
            })
        end,
        dependencies = {
            "ziontee113/color-picker.nvim",
            config = function()
                require("color-picker")
            end,
        },
    },

    { -- Treesitter
        -- YOU ALMOST CERTAINLY WANT A MORE ROBUST nvim-treesitter SETUP
        -- see https://github.com/nvim-treesitter/nvim-treesitter
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "InsertEnter" },
        dependencies = {
            -- "HiPhish/rainbow-delimiters.nvim",
            -- "nvim-treesitter/nvim-treesitter-textobjects",
            -- 		-- "JoosepAlviste/nvim-ts-context-commentstring",
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

    -- True ZEN :)
    {
        "folke/zen-mode.nvim",
        cmd = { "ZenMode" },
        dependencies = {
            "folke/twilight.nvim",
            cmd = { "Twilight" },
        },
    },
    -- {'Pocco81/true-zen.nvim', cmd = { 'TZAtaraxis', 'TZMinimalist', 'TZNarrow', 'TZFocus',}, },
    -- {  'junegunn/goyo.vim',
    --   cmd = "Goyo",},

    { -- Undotree
        "jiaoshijie/undotree",
        keys = "<leader>u",
        config = function()
            vim.keymap.set("n", "<leader>u", require("undotree").toggle, { noremap = true, silent = true })
            require("undotree").setup({
                float_diff = true, -- using float window previews diff, set this `true` will disable layout option
                layout = "left_bottom", -- "left_bottom", "left_left_bottom"
                window = { winblend = 28, width = 25 },
            })
        end,
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    -- { -- Neck-pain
    --       "shortcuts/no-neck-pain.nvim",
    --       cmd = "NoNeckPain",
    --  config = function ()
    --       require("Misc.Neck_pain")
    --       end
    --      },
    --
    -- Game
    {
        "ThePrimeagen/vim-be-good", -- learn VimBeGood
        cmd = "VimBeGood",
    },

    { -- middle scroll end of line
        "Aasim-A/scrollEOF.nvim",
        event = "CursorMoved",
        config = function()
            require("scrollEOF").setup()
        end,
    },

    -- 'rcarriga/nvim-notify',

    -- { -- Diff of some files
    --     "jemag/telescope-diff.nvim",
    --     -- keys = "<leader>s",
    --     dependencies = {
    --         { "nvim-telescope/telescope.nvim" },
    --     },
    --     config = function()
    --         require("telescope").load_extension("diff")
    --         vim.keymap.set("n", "<leader>sC", function()
    --             require("telescope").extensions.diff.diff_files({ hidden = true })
    --         end, { desc = "Compare 2 files" })
    --         vim.keymap.set("n", "<leader>sc", function()
    --             require("telescope").extensions.diff.diff_current({ hidden = true })
    --         end, { desc = "Compare file with current" })
    --     end,
    -- },

    -- { -- Search suggestion
    -- 	"tomiis4/Hypersonic.nvim",
    -- 	cmd = "Hypersonic",
    -- 	keys = { "/", "?" },
    -- 	config = function()
    -- 		require("hypersonic").setup({
    -- 			-- config
    -- 		})
    -- 	end,
    -- },

    -- {
    --     "HampusHauffman/block.nvim",
    --     event = "BufReadPost",
    --     config = function()
    --     require("block").setup({
    --         percent = 0.5,
    --         depth = 1.2,
    --         -- colors = nil,
    --         automatic = true,
    --         -- bg = nil,
    -- -- 	colors = {
    -- --          -- "#ff0000",
    -- -- --         "#00ff00",
    -- --         "#0000ff",
    -- --      },
    --     }) end
    -- },
    -- highlight text or words ⏯️
    -- "azabiong/vim-highlighter",
    -- Highlight URLS
    -- 'itchyny/vim-highlighturl',

    -- 'mg979/vim-visual-multi',

    -- a good set of commands
    -- {
    --   "LintaoAmons/easy-commands.nvim",
    --   event = "VeryLazy",
    --   opts = {},
    -- },
    -- { -- some (G,g) Function
    --   "echasnovski/mini.operators",
    --   keys = 'g',
    --   opts = true,
    -- },
    --

    -- "sindrets/diffview.nvim",

    { -- Hex Editing
        "RaafatTurki/hex.nvim",
        cmd = { "HexToggle", "HexDump" },
        opts = true,
    },
    { -- Change Cases using 'ga~~~~~~'
        "johmsalas/text-case.nvim",
        keys = "ga",
        config = function()
            require("textcase").setup({})
            require("telescope").load_extension("textcase")
            vim.api.nvim_set_keymap("n", "ga/", "<cmd>TextCaseOpenTelescope<CR>", { desc = "Telescope" }) -- for normal mode only
            vim.api.nvim_set_keymap("x", "ga/", "<cmd>TextCaseOpenTelescope<CR>", { desc = "Telescope" }) -- for Visual mode only
        end,
    },
    { -- Buffer managemenet
        "Pheon-Dev/buffalo-nvim",
        enabled = false,
    },
}, {})
