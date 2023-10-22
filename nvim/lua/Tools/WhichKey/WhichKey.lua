--  ╭────────────────────╮
--  │ Folke OG which key │
--  ╰────────────────────╯

M = {


  { -- Key Sheet , use 'echasnovski/mini.clue',
    "folke/which-key.nvim",
    event = "InsertEnter",
    keys = { "<leader>", '"', "z", "g", "<C-r>" },
    -- dependencies = "roobert/surround-ui.nvim",
    config = function()
      require("UI.Wkeys")
      -- some https://www.reddit.com/r/neovim/comments/15ay80f/a_good_snippet_if_you_use_whichkeynvim/
      -- basically registers thign
      -- function ClearReg()
      -- 	print("Clearing registers")
      -- 	vim.cmd([[
      -- let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
      -- for r in regs
      -- call setreg(r, [])
      -- endfor
      -- ]])
      -- end

      -- --Make it so i can call ClearReg as a command
      -- vim.api.nvim_create_user_command("ClearReg", function()
      -- 	ClearReg()
      -- end, {})
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },







}
return M
