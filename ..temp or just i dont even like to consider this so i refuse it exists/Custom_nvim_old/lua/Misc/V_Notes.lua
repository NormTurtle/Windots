-- TAKE notes on NEOVIM on fly
require('virt-notes').setup({
    -- directory to save notes at
   notes_path = vim.fn.stdpath("config") .. "/.tmp/virt_notes",
    -- highlight group for notes
    hl_group = "WildMenu",
    -- schemes that are removed from buffer name
    remove_schemes = {"oil"},
    -- mappings can be set to false to disable all
    mappings = {
        -- "<prefix>" in keys will be replaced with this
        prefix = "<Leader>a",
        -- keys are keys for mapping
        -- opts are map opts from vim.keymap.set
        --
        -- Actions can be set to string: {add = "<Leader>na"}
        actions = {
            add = {keys = "<prefix>a", opts = {desc = "Add note"}},
            edit = {keys = "<prefix>e", opts = {desc = "Edit note"}},
            remove = {keys = "<prefix>dd", opts = {desc = "Delete note"}},
            remove_on_line = {keys = "<prefix>dl", opts = {desc = "Delete all notes on line"}},
            remove_in_file = {keys = "<prefix>da", opts = {desc = "Delete all notes in file"}},
            copy = {keys = "<prefix>c", opts = {desc = "Copy note"}},
            -- cut deletes note when pasting (note: not deleting when buffer is unloaded)
            cut = {keys = "<prefix>x", opts = {desc = "Cut note"}},
            paste = {keys = "<prefix>p", opts = {desc = "Paste note"}}
        }
    }
})
