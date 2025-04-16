require('hlchunk').setup({
  chunk = { enable = true, }, -- the ──► like Joint idk

  indent = {
      enable = false,
      use_treesitter = false,
    chars = {
      "│",
    },
      chars = {
          " ",
      },
      style = {
          { bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui") },
      },
      exclude_filetype = {
        lspinfo = true,
        checkhealth = true,
        man = true,
        mason = true,
        plugin = true,
        glowpreview = true,
    },
  },

  line_num =  -- hightl code blcok nums
    { style = "#806d9c", },

blank = {
    enable = true,
        -- chars = { "․", },
    chars = {
        " ",
    },
    style = {
        { bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("cursorline")), "bg", "gui") },
        { bg = "", fg = "" },
    },
      exclude_filetype = {
        dashboard = true,
        help = true,
        lspinfo = true,
        packer = false,
        checkhealth = true,
        man = true,
        mason = true,
        sfm = true,
        plugin = true,
        glowpreview = true,
      startify = true,
    },
}
})
