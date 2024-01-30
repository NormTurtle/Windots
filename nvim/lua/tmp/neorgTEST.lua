local cpath = vim.fn.stdpath("config") -- Define a .config/nvim as path

require('neorg').setup {
  load = {
    ["core.defaults"] = {}, -- Loads default behaviour
    ["core.concealer"] = {}, -- { config = { icon_preset = "varied" } },
    -- ["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
    -- ["core.gtd.base"] = { config = { workspace = "gtd", }, },
    ["core.dirman"] = { -- Manages Neorg workspaces
      config = {
        workspaces = {
          home = cpath .. "/.tmp/org/home",
          -- gtd = cpath .. ".tmp/org/gtd",
          notes = cpath .. "/.tmp/org/notes",
        },
        default_workspace = "notes",
      },
    },
  },
}
