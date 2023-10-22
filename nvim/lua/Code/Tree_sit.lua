-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

-- configure treesitter
treesitter.setup({
  -- enable syntax highlighting
  highlight = {
    enable = true,
  },
  -- vim-matchup 
  matchup = {
    enable = true,              -- mandatory, false will disable the whole extension
    disable = { "c", "ruby" },  -- optional, list of language that will be disabled
  },
  -- enable indentation
  indent = { enable = true },
  rainbow = { enable = true, extended_mode = true, },
  context_commentstring = { enable = true, enable_autocmd = false, },
  -- enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = { enable = true },
  -- not to install the support
  ignore_install = { "markdown", "c", "rust", "ini",}, -- list of parsers to ignore installing

  -- ensure these language parsers are installed
 ensure_installed = {
   -- "norg",
--    "markdown",
--    "markdown_inline",
--   "lua",
--    "vim",
--    "vimdoc",
 },
  -- auto install above language parsers
  auto_install = true,
})
