--         ╭──────────────────────────────────────────────────────────╮
--         │                       forever undo                       │
--         ╰──────────────────────────────────────────────────────────╯
M = {
	{ -- just do undo all life
		"kevinhwang91/nvim-fundo",
		event = "BufReadPre",
		dependencies = "kevinhwang91/promise-async",
		build = function()
			require("fundo").install()
		end,
		config = function()
			-- For more info on undofile check lua.options at #34
			vim.opt.undodir = vim.fn.stdpath("config") .. "/.tmp/undo"
			vim.opt.undofile = true
			require("fundo").setup()
		end,
	},
}
return M
