-- JK , JJ exit for neovim

return {
  { -- Esc
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
}
-- there is also HOUDINI  which state better then this
