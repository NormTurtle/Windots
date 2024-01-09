--  ╭──────────╮
--  │ SFM CONF │
--  ╰──────────╯
vim.keymap.set("n", "<leader>e", "<cmd>SFMToggle<CR>", { desc = "SFM Tree" }) -- toogle exp file

M = {

    {
        "dinhhuy258/sfm.nvim",
        cmd = "SFMToggle",
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
            { "dinhhuy258/sfm-bookmark.nvim" },
            { "dinhhuy258/sfm-filter.nvim" },
            { "dinhhuy258/sfm-git.nvim" },
            { "dinhhuy258/sfm-telescope.nvim" },
            { "dinhhuy258/sfm-paste.nvim" }, -- MacOs only
        },

        config = function()
            local sfm_explorer = require("sfm").setup({
                view = {
                    side = "left", -- side of the tree, can be `left`, `right`. this setting will be ignored if view.float.enable is set to true,
                    width = 27, -- this setting will be ignored if view.float.enable is set to true,
                    float = {
                        enable = false,
                        config = {
                            relative = "editor",
                            border = "rounded",
                            width = 30, -- int or function
                            height = 30, -- int or function
                            row = 1, -- int or function
                            col = 1, -- int or function
                        },
                    },
                    render_selection_in_sign = true,
                },
                mappings = {
                    custom_only = true,
                    list = {
                        -- Edit
                        { key = "l", action = "edit" }, -- just to open file to buffer
                        { key = "<cr>", action = "edit" }, -- just to open file to buff
                        -- Change position
                        { key = "h", action = "change_root_to_parent" }, --Change root dir, parent dir of the current entry
                        { key = "ctr-]", action = "change_root_to_parent" }, --Change root dir, parent dir of the current entry
                        { key = "o", action = "change_root_to_entry" }, --Change root dir, current folder entry or to the parent dir of current file entry
                        { key = "<tab>", action = "change_root_to_entry" }, --Change root dir, current folder entry or to the parent dir of current file entry
                        { key = "]", action = "change_root_to_entry" }, --Change root dir, current folder entry or to the parent dir of current file entry
                        -- Quit
                        { key = "q", action = "close" },
                        { key = "<esc>", action = "close" },
                        { key = "<C-r>", action = "reload" }, -- Reload the explorer
                        -- Splits
                        { key = "<C-h>", action = "vsplit" },
                        { key = "<C-v>", action = "split" },
                        { key = "<C-t>", action = "tabnew" },
                        -- Movement
                        -- { key = "u",     action = "parent_entry",},	        -- Move cursor to the parent directory
                        { key = "<s-tab>", action = "close_entry" }, -- Close current opened directory or parent
                        { key = "p", action = "parent_entry" }, -- Move cursor to the parent directory
                        { key = "J", action = "first_sibling" }, --	Navigate to the first sibling of current file or directory
                        { key = "K", action = "last_sibling" }, -- Navigate to the last sibling of current file or directory
                        -- FS
                        { key = "R", action = "reload" }, -- Reload the explorer
                        { key = "q", action = "close" }, -- Close the explorer window
                        { key = "a", action = "create" }, -- Create a new file/directory in the current folder
                        { key = "c", action = "copy" }, -- Copy the current file or directory to a destination path specified by the user
                        { key = "p", action = "copy_selections" }, -- Copy all selected files or directories to the current folder
                        { key = "r", action = "move" }, -- Move/rename the current file or directory
                        { key = "x", action = "move_selections" }, -- Move all selected files or directories to the current folder
                        { key = "dd", action = "delete" }, -- Delete the current file or directory
                        { key = "ds", action = "delete_selections" }, -- Delete all selected files or directories
                        { key = "v", action = "toggle_selection" }, -- Toggle the selection of the current file or directory
                        { key = "C", action = "clear_selections" }, -- Clear all selections
                        -- trash	Trash the current file or directory
                        -- trash_selections	Trash all selected files or directories
                        -- { key = ";", action =  "system_open", },  -- Open the selected file or directory using system default program
                        -- { key = "'", action =  "system_open_selections", }, --  Open all selected files or directories using system default program        --
                    },
                },
                renderer = {
                    icons = {
                        file = { default = "", symlink = "" },
                        folder = {
                            default = "",
                            open = "",
                            symlink = "",
                            symlink_open = "",
                        },
                        indicator = {
                            folder_closed = "",
                            folder_open = "",
                            file = " ",
                        },
                        selection = "",
                    },
                },
                misc = {
                    trash_cmd = nil,
                },
            })
            sfm_explorer:load_extension("sfm-bookmark") -- `m` to mark files navigate with '`' (backtick)
            sfm_explorer:load_extension("sfm-filter") -- press `.`(dot) to remove dotFiles
            sfm_explorer:load_extension("sfm-git") -- git plugin to track changed files
            sfm_explorer:load_extension("sfm-telescope") -- `/` (slash) to search files using telescope
            -- sfm_explorer:load_extension "sfm-paste" -- Only MacOs  Right Now
        end,
    },
}
return M
