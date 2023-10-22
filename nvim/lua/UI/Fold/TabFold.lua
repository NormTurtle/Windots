M = {

    -- Tab to toggle fold
    {
        "jghauser/fold-cycle.nvim",
        keys = { "<Tab>", "<s-tab>", "zi", "zC" },
        config = function()
            require("fold-cycle").setup({
                open_if_max_closed = true, -- closing a fully closed fold will open it
                close_if_max_opened = true, -- opening a fully open fold will close it
                softwrap_movement_fix = true, -- see below
            })
            -- Open Fold {Open the next level of (nested) folds}
            vim.keymap.set("n", "<tab>", function()
                return require("fold-cycle").open()
            end, { silent = true, desc = "Fold-cycle: open folds" })
            -- Close fold {Close the next level of (nested) folds}
            vim.keymap.set("n", "<s-tab>", function()
                return require("fold-cycle").close()
            end, { silent = true, desc = "Fold-cycle: close folds" })
            -- Open ALL fold {Open a fold and all its nested folds}
            vim.keymap.set("n", "zC", function()
                return require("fold-cycle").open_all()
            end, { remap = true, silent = true, desc = "Fold-cycle: open all folds" })
            -- -- Close ALL fold {Close a fold and all its nested folds}
            -- vim.keymap.set('n', 'zc',
            --   function() return require('fold-cycle').close_all() end,
            --   { remap = true, silent = true, desc = 'Fold-cycle: close all folds' })
            -- Toggle ALL fold {Toggle a fold and its nested folds closed/open}
            vim.keymap.set("n", "zi", function()
                return require("fold-cycle").toggle()
            end, { remap = true, silent = true, desc = "Fold-cycle: toggle all folds" })
        end,
    },
}
return M
