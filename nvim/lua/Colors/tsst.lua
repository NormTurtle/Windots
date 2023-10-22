-- Using before and after.
require("themery").setup({
  themes = {{
    name = "Aura",
    colorscheme = "aura",
    before = [[
      -- All this block will be executed before apply "set colorscheme"
      vim.opt.background = "dark"
    ]],
  },
  {
    name = "haba",
    colorscheme = "habamax",
    -- before = [[
    --   vim.opt.background = "habamax"
    -- ]],
    -- after = [[-- Same as before, but after if you need it]]
  }},
})
