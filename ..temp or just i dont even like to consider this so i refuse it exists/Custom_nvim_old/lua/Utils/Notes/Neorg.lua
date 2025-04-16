--  ╭──────────────────╮
--  │ BAsed note takign │
--  ╰──────────────────╯
M = {

	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		ft = "norg",
		cmd = "Neorg",
		dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-neorg/neorg-telescope" } },
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					-- Adds pretty icons to your documents
					["core.concealer"] =  {},
					-- ["core.concealer"] = { config = { icon_preset = "diamond" } },
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								notes = "~/Documents/notes",
							},
							-- ["core.export"] = {}, -- File export to md
							-- external
							-- ["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
							-- ["core.integrations.nvim-cmp"] = {}, -- neorg with cmp
							-- ["core.integrations.telescope"] = {}, -- 3rd-patry integrations of telescope
						},
					},
				},
			})
		end,
	},
}

return M
