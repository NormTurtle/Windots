-- ever in a need of distro nvim use this one only
-- https://github.com/Bekaboo/nvim   -- MACRo nano/emacs inspired distro
-- 1st line
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
-- sync file in remote serverj
--https://github.com/coffebar/transfer.nvim
--https://github.com/GCBallesteros/machinegun.nvim
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
    { import = "UI.Colors.HexColorHL" }, --
    --  ╭───────────────────────────────╮
    --  │ Statusline | Tabline | &Lines │
    --  ╰───────────────────────────────╯
    { import = "UI.Lines.Lualine" }, -- normal lualine
    -- { import = "UI.Lines.LualineEvil" }, -- Evil-Theme lualine
    -- { import = "UI.Lines.sStatus" }, -- fast Statusline
    -- { import = "UI.Lines.InCline" },
    { import = "UI.Lines.ColorsPick" }, -- pick colors
    -- { import = "UI.Lines.BreadCrumb" }, -- Dropbar
    { -- buffer managemenet & tabline
        "pablopunk/unclutter.nvim",
        event = "VeryLazy",
        opts = {
            hijack_jumplist = false,
        },
    },
    --  ╭────────────────────────╮
    --  │  Navigation | Movement │
    --  ╰────────────────────────╯
    { import = "UI.Nav.LastPlace" }, -- Get to the last position whereu were
    -- { import = "UI.Nav.BtrEsc" }, -- Better escape(jk)
    { import = "UI.Nav.Houdini" }, -- Houdini , Also Better escape(jk)
    -- { import = "UI.Nav.WildFire" }, -- Increment selection with <cr>
    { import = "UI.Nav.Spider" }, -- change movement w W e E ge
    -- { import = "UI.Nav.Nword" },   --  more versatile n(ext) key  not workign niga
    -- { import = "UI.Nav.Flash" }, -- Flash.floke to (s)earch in in normal mode
    -- { import = "UI.Nav.Ftline" }, -- (F,t,f,T) key better search
    { import = "UI.Nav.SymbolsOutlines" }, -- tree view with lsp symbols
    { import = "UI.Nav.MoveMini" }, --  "<A-k>", "<A-j>", "<A-l", "<A-h"

    { -- middle scroll end of line
        "Aasim-A/scrollEOF.nvim",
        event = "InsertEnter", -- i did that so i can see what happen without it
        config = function()
            require("scrollEOF").setup()
        end,
    },

    --         ╭──────────────────────────────────────────────────────────╮
    --         │               Split and Window Managemenet               │
    --         ╰──────────────────────────────────────────────────────────╯
    { import = "UI.Win.SplitPlugin" }, -- Tmux like window managemenet
    { import = "UI.Win.Hydra" }, -- Which like suggestion
    { import = "UI.Win.MultiCursor" }, -- Which like suggestion
    --  ╭──────────────────────────────────────────────────────╮
    --  │ Cmdline | Wilder | Search | Floating help | hlsearch │
    --  ╰──────────────────────────────────────────────────────╯
    { import = "UI.Cmdline.Plugs" },
    --  ╭────────────╮
    --  │ Fold | UFO │
    --  ╰────────────╯
    -- { import = "UI.Fold.UF0" }, -- Ufo not in the sky
    -- { import = "UI.Fold.PrettyFold" }, -- Ui modification | now vim buitin
    -- { import = "UI.Fold.TabFold" }, -- Ui modification
    --         ╭──────────────────────────────────────────────────────────╮
    --         │                          Notes                           │
    --         ╰──────────────────────────────────────────────────────────╯

    -- { import = "Edit.Note" },
    -- { import = "Utils.Notes.Neorg" },-- if using NEORG  https://github.com/pysan3/Norg-Tutorial
    --         ╭──────────────────────────────────────────────────────────╮
    --         │                          Tools                           │
    --         ╰──────────────────────────────────────────────────────────╯
    -- { import = "Tools.Visualize.UndoTree" }, -- Visual-ize your undoing
    -- { import = "tmp.TEST.DupeKeys" }, -- check for Dupe keys
    --  ╭─────────╮
    --  │  LSP    │
    --  ╰─────────╯
    { import = "Tools.LSP.BiGfile" }, -- Remove all lsp for bigfiles
    { import = "Tools.LSP.TreeShiter" }, -- Remove all lsp for bigfiles
    { import = "Tools.LSP.Lsp" }, -- lsp.zero , fidget , mason
    { import = "Tools.LSP.LspTimeOut" }, -- save Ram from lsp
    { import = "Tools.LSP.ILLUMINATI" }, -- highlight matches words of currect cursur
    --  ╭────────────╮
    --  │ Completion │
    --  ╰────────────╯
    { import = "Tools.Cmp.Cmp_0" }, -- Completion
    { import = "Tools.Cmp.Tabout" }, -- TAB-jump
    -- { import = "Tools.Cmp.ePo" }, -- fast auto-Completion register_user_commandlly
    -- { import = "Tools.Cmp.MiniCmp" }, -- din't work
    --  ╭─────────╮
    --  │ NULL.ls │
    --  ╰─────────╯
    -- { import = "Tools.LSP.NullLs" }, -- set of language server
    -- i droped to configure it because im lazy
    -- { import = "Tools.Visualize.Fundo" }, -- store undo changes for long
    --  ╭───────────╮
    --  │ Formatter │
    --  ╰───────────╯
    { import = "Tools.Formater.conform" }, -- conform a buggy formater
    -- { import = "Tools.Formater.4mater" }, -- Fomatter.nvim
    { import = "Tools.Formater.Align" }, -- Mini Alighn
    { import = "Tools.Formater.Trim" }, -- remove Whitespace

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
    { import = "Tools.SsrSearch" }, -- TS basesd search | Search and replace
    --  ╭───────────────────────────────╮
    --  │  Editing | Autopair | Tabout  │
    --  ╰───────────────────────────────╯
    { import = "Code.Pair" }, -- Brackts, Parent, quotes, Completion, ultimate-autopair.
    --  ╭──────────╮
    --  │ Terminal │
    --  ╰──────────╯
    -- { import = "Misc.Term.Fterm" }, -- numToStr
    -- { import = "Misc.Term.tt" }, -- term with winbar WIP by you
    --  ╭──────╮
    --  │ Misc │
    --  ╰──────╯
    -- { import = "Misc.DataSc.DataViewCSV", }, -- view csv,tsv DATAVIEW
    -- https://github.com/cameron-wags/rainbow_csv.nvim for reainbowed CSV easy view
    --  ╭──────────────────────────╮
    --  │ File manager | Sfm | Oil │
    --  ╰──────────────────────────╯
    { import = "Fm.Sfm" }, -- (Simple) File Manager
    { import = "Fm.Oil" }, -- O(il)
    --  ╭──────────╮
    --  │ Markdown │
    --  ╰──────────╯
    { import = "Utils.Markdown.PreviewMD" }, -- Glow , Markdown-Preview
    -- { import = "Utils.Markdown.ImgPaste" }, -- Pasting image
    -- https://github.com/wallpants/github-preview.nvim
    -- uses BUN .js and not work in window11:w
    -- { import = "Utils.Markdown.TEST" }, --
    -- -- 'frabjous/knap', -- use it one linux ^^ preview
    -- { -- Clander View
    --     "itchyny/calendar.vim", -- Calendar with the coolest CLOCK view
    --     cmd = { "Calendar" },
    -- },
    -- { -- auto-bullets for markdown-like filetypes
    --     "dkarter/bullets.vim",
    --     ft = "markdown",
    --     config = function()
    --         vim.g.bullets_delete_last_bullet_if_empty = 1
    --     end,
    -- },
    -- { -- Markdown Keys                     Only wors in Visual mode
    --     "antonk52/markdowny.nvim", -- <c-e> = code block , <c-k> = link , <c-i> = italic , <c-b> = bold ,
    --     ft = { "markdown", "txt", "md" },
    --     config = function()
    --         require("markdowny").setup()
    --     end,
    -- },

    --  ╭─────╮
    --  │ Git │
    --  ╰─────╯
    -- { import = "Code.Git.Diffview" },
    { import = "Code.Git.GitSigns" },
    { import = "Code.Git.Lazygit" },
    -- { import = "Code.Git.Magit" },

    --  ╭─────────────────────────────────╮
    --  │ Ai | Bard, Gemini | GPT CoPilot │
    --  ╰─────────────────────────────────╯
    -- { import = "Misc.AI.Bard" },
    -- { import = "Misc.AI.LLm" }, -- PALM 2 api
    -- { import = "Misc.AI.Gemini" }, -- PALM 2 api
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

    -- Markdown
    -- { 'renerocksai/calendar-vim', -- some calender for wiki
    --   cmd = { "Calendar", "CalendarH", "CalendarT", "CalendarVR", "CalendarSearch", }, },
    --itchyny/calendar.vim
    -- Markdown Tool s'
    -- {
    -- 	"gaoDean/autolist.nvim", -- 🔥 powerfull autolist,checkbox toggle, full Markdown Weapon
    -- 	ft = {
    -- 		"markdown", --[[ "text",  ]]
    -- 		"tex",
    -- 		"plaintex",
    -- 	},
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

    --   { -- coool over 28 module for markdonw preview
    -- 'cnshsliu/smp.nvim',
    -- build ="cd lua/server && npm install",   -- yes, we should have node & npm installed.
    -- dependencies = {
    --   "nvim-telescope/telescope.nvim",
    --   "MunifTanjim/nui.nvim",
    --     },
    --     },

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
        -- config = function()
        --     require("nvim-surround").setup()
        -- end,
        opts = true,
    },

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

    -- { "milanglacier/yarepl.nvim", config = true },
    { "HiPhish/repl.nvim" },
}, {})
