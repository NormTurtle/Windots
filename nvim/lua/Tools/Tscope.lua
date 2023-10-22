-- plugins/telescope.lua:
return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    cmd = "Telescope",
    dependencies = {
        { "nvim-lua/plenary.nvim" }, -- NEEDED
        -- Extensions
        --https://github.com/nvim-telescope/telescope-media-files.nvim -- Must try
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        { "brookhong/telescope-pathogen.nvim" },
        -- { "nvim-telescope/telescope-ui-select.nvim" },
        { "nvim-telescope/telescope-symbols.nvim" }, -- Glyh,emoji,Kaomoji,Math,Latex,Gitmoji
        {
            "nvim-telescope/telescope-file-browser.nvim",
            keys = { -- File_browser
                { "<leader>fm", ":Telescope file_browser<CR>", silent = true },
                { "<leader>fc", ":Telescope colorscheme<CR>", silent = true },
            },
        },
        { "debugloop/telescope-undo.nvim" },
    },
    keys = {
        -- Pathogen
        { "<leader>fs", ":Telescope pathogen live_grep<CR>", silent = true },
        { "<leader>fp", ":Telescope pathogen<CR>", silent = true },
        { "<leader>ff", ":Telescope pathogen find_files<CR>", silent = true },
        { "<leader>fw", ":Telescope pathogen grep_string<CR>", silent = true },
    },

    config = function()
        -- Enable indent-guides in telescope preview
        vim.api.nvim_create_autocmd("User", {
            pattern = "TelescopePreviewerLoaded",
            group = vim.api.nvim_create_augroup("rafi_telescope", {}),
            callback = function(args)
                if args.buf ~= vim.api.nvim_win_get_buf(0) then
                    return
                end
                vim.opt_local.listchars = vim.wo.listchars .. ",tab:▏\\ "
                vim.opt_local.conceallevel = 0
                vim.opt_local.wrap = true
                vim.opt_local.list = true
                vim.opt_local.number = true
            end,
        })

        require("telescope").setup({
            defaults = {
                prompt_prefix = "   ",
                show_icon = true, -- icon in the first column
                sorting_strategy = "ascending",
                winblend = 14, -- Transparancy
                layout_strategy = "horizontal",
                -- path_display = { "truncate" },
                border = {},
                borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                color_devicons = true,
                mappings = {
                    n = { ["q"] = require("telescope.actions").close },
                },
                file_ignore_patterns = { "node_modules", ".pyc" },
                -- preview = true,
                -- layout_config = {
                -- 	-- height = vim.o.lines, -- maximally available lines
                -- 	width = vim.o.columns, -- maximally available columns
                -- 	prompt_position = "top",
                -- 	-- preview_width = 0.6, --60% of available lines
                -- },
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                        results_width = 0.8,
                    },
                    vertical = {
                        mirror = true,
                    },
                    width = 0.87,
                    height = 0.80,
                    preview_cutoff = 120,
                },
            },
            pickers = {
                colorscheme = {
                    enable_preview = true, -- live preview theme
                    theme = "dropdown",
                    winblend = 18,
                    borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
                    layout_config = {
                        vertical = {
                            mirror = true,
                            results_width = 0.9,
                        },
                        -- horizontal = {
                        -- 	results_width = 0.9,
                        -- },
                        -- width = 0.27,
                        -- height = 0.30,
                        -- preview_cutoff = 1,
                    },
                    -- border = false,
                    border = {},
                },

                find_files = {
                    theme = "dropdown",
                    winblend = 24,
                    border = true,
                    previewer = true,
                    shorten_path = true,
                    heigth = 20,
                    width = 120,
                },
            },
            extensions = {
                ["pathogen"] = {
                    -- remove below if you want to enable it
                    use_last_search_for_live_grep = true,
                },
                file_browser = {
                    theme = "ivy",
                    -- disables netrw and use telescope-file-browser in its place
                    hijack_netrw = true,
                },
                undo = {
                    side_by_side = true,
                    layout_strategy = "vertical",
                    layout_config = {
                        preview_height = 0.8,
                    },
                },
                fzf = {
                    fuzzy = true, -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true, -- override the file sorter
                    case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                    -- the default case_mode is "smart_case"
                },

                -- ["ui-select"] = { require("telescope.themes").get_dropdown({}) },
            },
        })
        -- Extensions
        require("telescope").load_extension("file_browser")
        require("telescope").load_extension("pathogen") -- pathogen
        require("telescope").load_extension("undo")
        require("telescope").load_extension("fzf")
        -- require("telescope").load_extension("ui-select")
        -- vim.keymap.set("v", "<space>g", require("telescope").extensions["pathogen"].grep_string)

        -- --- Key
        -- local builtin = require("telescope.builtin")
        -- vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
        -- vim.keymap.set("n", "<leader>fs", builtin.live_grep, {})
        -- vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
        -- vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
    end,
}
