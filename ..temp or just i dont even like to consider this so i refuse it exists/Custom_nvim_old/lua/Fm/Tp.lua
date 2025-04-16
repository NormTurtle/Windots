-- plugins/telescope.lua:
return {

	"nvim-telescope/telescope.nvim",
	tag = "0.1.2",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		-- DEfault keys
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "find files in current dir respects .gitignore" },
		{ "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "find string in current dir as you type  " },
		{ "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = " find string under cursor in dir" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "list open buffers in current instance" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "list available help tags" },
	},

	config = function()
		-- Enable indent-guides in telescope preview
		vim.api.nvim_create_autocmd("User", {
			pattern = "TelescopePreviewerLoaded",
			group = vim.api.nvim_create_augroup("rafi_telescope", {}),
			callback = function(args)
				if args.buf ~= vim.api.nvim_win_get_buf(0) then
					return
				end
				vim.opt_local.listchars = vim.wo.listchars .. ",tab:▏\\ "
				vim.opt_local.conceallevel = 0
				vim.opt_local.wrap = true
				vim.opt_local.list = true
				vim.opt_local.number = true
			end,
		})

		-- vim.api.nvim_set_hl(0, "TelescopeBorder", {ctermbg=10})
		-- vim.api.nvim_set_hl(0, "TelescopePromptBorder", {ctermbg=238})
		-- vim.api.nvim_set_hl(0, "TelescopeResultsBorder", {ctermbg=238})
		-- vim.api.nvim_set_hl(0, "TelescopePreviewBorder", {ctermbg=238})

		require("telescope").setup({
			defaults = {
				sorting_strategy = "ascending",
				layout_strategy = "bottom_pane",
				results_title = "",
				file_ignore_patterns = { "node_modules", ".pyc" },
				borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
				prompt_prefix = ":",
				preview = true,
				layout_config = {
					prompt_position = "bottom",
				},
			},

			pickers = {
				find_files = {
					theme = "dropdown",
				},
			},
			extensions = {
				-- ...
			},
		})
	end,
}
