return {

  -- { -- Easy of github issue on editor
  -- 	"pwntester/octo.nvim",
  -- 	cmd = "Octo",
  -- 	dependencies = {
  -- 		"nvim-lua/plenary.nvim",
  -- 		"nvim-telescope/telescope.nvim",
  -- 		"nvim-tree/nvim-web-devicons",
  -- 	},
  -- 	config = function()
  -- 		require("octo").setup()
  -- 	end,
  -- },
  { -- diff / merge
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    cmd = { "DiffviewFileHistory", "DiffviewOpen" },
    config = function() -- needs config, for access to diffview.actions in mappings
      require("diffview").setup({
        -- https://github.com/sindrets/diffview.nvim#configuration
        enhanced_diff_hl = false, -- true = no red for deletes
        show_help_hints = false,
        file_history_panel = {
          win_config = { height = 5 },
        },
        hooks = {
          diff_buf_read = function()
            -- set buffername, mostly for tabline (lualine)
            pcall(function()
              vim.api.nvim_buf_set_name(0, "Diffview")
            end)
          end,
        },
        keymaps = {
          view = {
            { "n", "<A-w>", vim.cmd.tabclose, {} }, -- close tab instead of window
            {
              "n",
              "<S-CR>",
              function()
                vim.cmd.wincmd("w")
              end,
              {},
            }, -- consistent with general buffer switcher
          },
          file_history_panel = {
            { "n", "<A-w>", vim.cmd.tabclose,                                       {} },
            { "n", "?",     require("diffview.actions").help("file_history_panel"), {} },
            {
              "n",
              "<S-CR>",
              function()
                vim.cmd.wincmd("w")
              end,
              {},
            },
          },
        },
      })
    end,
  },
}
