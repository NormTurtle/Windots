-- plugins/telescope.lua:
local Plugin = {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    cmd = "Telescope",
    keys = "<leader>f",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
    },
}

Plugin.config = function()
    require("telescope").setup({
        extensions = {
            file_browser = {
                theme = "dropdown",
                hijack_netrw = false,
                previewer = false,
            },
        },
    })

    local map = vim.keymap.set
    local builtin = require("telescope.builtin")
    require("telescope").load_extension("file_browser")

    -- Builtins
    map("n", "<leader>ff", builtin.find_files, { desc = "[f]ind [f]ile" })
    map("n", "<leader>fs", builtin.live_grep, { desc = "[f]ind [s]tring" })
    map("n", "<leader>fc", builtin.grep_string, { desc = "[f]ind at [c]ursor" })
    map("n", "<leader>fh", builtin.help_tags, { desc = "[f]ind [h]elp" })

    -- LSP
    map("n", "<leader>fo", builtin.lsp_document_symbols, { desc = "[f]ind [o]bject in buffer" })
    map("n", "<leader>fO", builtin.lsp_dynamic_workspace_symbols, { desc = "[f]ind [O]bject in repo" })
    map("n", "<leader>fr", builtin.lsp_references, { desc = "[f]ind [r]eferences" })
    map("n", "<leader>fd", builtin.lsp_definitions, { desc = "[f]ind [d]efinition" })
    map("n", "<leader>ft", builtin.lsp_type_definitions, { desc = "[f]ind [t]ype" })
    map("n", "<leader>fi", builtin.lsp_implementations, { desc = "[f]ind [i]mplementations" })

    -- Plugins
    map(
        "n",
        "<leader>fm",
        "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>",
        { desc = "[e]xplore files" }
    )
end

return { Plugin }

-- require("telescope").setup({
--     defaults = {
--         prompt_prefix = "   ",
--         show_icon = true, -- icon in the first column
--         sorting_strategy = "ascending",
--         winblend = 14, -- Transparancy
--         layout_strategy = "horizontal",
--         -- path_display = { "truncate" },
--         border = {},
--         borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
--         color_devicons = true,
--         mappings = {
--             n = { ["q"] = require("telescope.actions").close },
--         },
--         file_ignore_patterns = { "node_modules", ".pyc" },
--         -- preview = true,
--         -- layout_config = {
--         -- 	-- height = vim.o.lines, -- maximally available lines
--         -- 	width = vim.o.columns, -- maximally available columns
--         -- 	prompt_position = "top",
--         -- 	-- preview_width = 0.6, --60% of available lines
--         -- },
--         layout_config = {
--             horizontal = {
--                 prompt_position = "top",
--                 preview_width = 0.55,
--                 results_width = 0.8,
--             },
--             vertical = {
--                 mirror = true,
--             },
--             width = 0.87,
--             height = 0.80,
--             preview_cutoff = 120,
--         },
--     },
--     pickers = {
--         colorscheme = {
--             enable_preview = true, -- live preview theme
--             theme = "dropdown",
--             winblend = 18,
--             borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
--             layout_config = {
--                 vertical = {
--                     mirror = true,
--                     results_width = 0.9,
--                 },
--                 -- horizontal = {
--                 -- 	results_width = 0.9,
--                 -- },
--                 -- width = 0.27,
--                 -- height = 0.30,
--                 -- preview_cutoff = 1,
--             },
--             -- border = false,
--             border = {},
--         },
--
--         find_files = {
--             theme = "dropdown",
--             winblend = 24,
--             border = true,
--             previewer = true,
--             shorten_path = true,
--             heigth = 20,
--             width = 120,
--         },
--     },
--     extensions = {
--         ["pathogen"] = {
--             -- remove below if you want to enable it
--             use_last_search_for_live_grep = true,
--         },
--         file_browser = {
--             theme = "ivy",
--             -- disables netrw and use telescope-file-browser in its place
--             hijack_netrw = true,
--         },
--         undo = {
--             side_by_side = true,
--             layout_strategy = "vertical",
--             layout_config = {
--                 preview_height = 0.8,
--             },
--         },
--         fzf = {
--             fuzzy = true, -- false will only do exact matching
--             override_generic_sorter = true, -- override the generic sorter
--             override_file_sorter = true, -- override the file sorter
--             case_mode = "smart_case", -- or "ignore_case" or "respect_case"
--             -- the default case_mode is "smart_case"
--         },
--
--         -- ["ui-select"] = { require("telescope.themes").get_dropdown({}) },
--     },
-- })
