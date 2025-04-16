--  ╭────────────────╮
--  │   CmdlineEnter │
--  ╰────────────────╯

return {

    { -- Dynamic Search highlight
        "asiryk/auto-hlsearch.nvim",
        keys = { "/", "?", "*", "#", "n", "N" },
        config = function()
            require("auto-hlsearch").setup()
        end,
    },

    -- { -- help floating view
    --   'Tyler-Barham/floating-help.nvim',
    --   keys = ":",
    --   config = function ()
    --     local fh = require('floating-help')
    --     fh.setup({
    --       -- Defaults
    --       width = 60,   -- Whole numbers are columns/rows
    --       height = 0.9, -- Decimals are a percentage of the editor
    --       position = 'E',   -- NW,N,NW,W,C,E,SW,S,SE (C==center)
    --     })
    --     -- Create a keymap for toggling the help window
    --     vim.keymap.set('n', '<C-h>', fh.toggle)
    --
    --     -- Only replace cmds, not search; only replace the first instance
    --     local function cmd_abbrev(abbrev, expansion)
    --       local cmd = 'cabbr ' .. abbrev .. ' <c-r>=(getcmdpos() == 1 && getcmdtype() == ":" ? "' .. expansion .. '" : "' .. abbrev .. '")<CR>'
    --       vim.cmd(cmd)
    --     end
    --
    --     -- Redirect `:h` to `:FloatingHelp`
    --     cmd_abbrev('h',         'FloatingHelp')
    --     cmd_abbrev('help',      'FloatingHelp')
    --     cmd_abbrev('helpc',     'FloatingHelpClose')
    --     cmd_abbrev('helpclose', 'FloatingHelpClose')
    --
    --   end
    -- },

    { -- Wild menu at cmd
        "gelguy/wilder.nvim",
        keys = { "/", ":", "?" },
        -- build = "<CMD> UpdateRemotePlugins",
        -- event = "CmdlineEnter",
        config = function()
            -- require("Wilder")
            require("UI.Cmdline.Wilder")
        end,
    },

    --
    -- { -- Floating messages
    -- 	"AckslD/messages.nvim",
    -- 	cmd = { "Messages" },
    -- 	config = true,
    -- },
}
