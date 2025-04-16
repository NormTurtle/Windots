M = {

    { --  Completion
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            -- Snippets
            "VonHeikemen/lsp-zero.nvim",
            -- LuaSnip
            -- { "L3MON4D3/LuaSnip",         version = "2.*",                    dependencies = "rafamadriz/friendly-snippets" },
            -- "saadparwaiz1/cmp_luasnip", -- Luasnip source for cmp
            { -- Snippy
                "dcampos/nvim-snippy",
                keys = {
                    { "<Tab>", mode = { "i", "x" } },
                    "g<Tab>",
                },
                ft = "snippets",
            },
            "dcampos/cmp-snippy",
            "onsails/lspkind.nvim", -- icon on Completion
            -- FOR MATH or UNI
            "hrsh7th/cmp-calc", -- Math calculator
            -- Text
            "f3fora/cmp-spell", -- spelling is bad 😔
            "hrsh7th/cmp-buffer", -- suggestion form current file
            "hrsh7th/cmp-emoji", -- super use : : emojie in colon
            "hrsh7th/cmp-nvim-lsp", -- cmp form LSP idk?
            -- "lukas-reineke/cmp-rg",     -- Ripgrep
            -- { "tzachar/cmp-fuzzy-buffer", dependencies = "tzachar/fuzzy.nvim" },
            -- { "tzachar/cmp-fuzzy-path", dependencies = "tzachar/fuzzy.nvim" }, -- Fuzzy path search
            -- Path
            -- 			-- "FelipeLema/cmp-async-path", -- // paths cmp
            "hrsh7th/cmp-path", -- paths //
            -- 			-- 'dmitmel/cmp-digraphs',
        },
        config = function()
            require("Tools.Cmp.Snippy_snip") -- Maping are in Lua_snip
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                        -- require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                        require("snippy").expand_snippet(args.body) -- For `snippy` users.
                        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered({
                        border = "shadow",
                        side_padding = 3,
                        col_offset = -5,
                        -- windhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Seach:None",
                    }),
                    -- documentation = cmp.config.window.bordered(),
                    documentation = {
                        max_height = 15,
                        max_width = 60,
                    },
                },
                -- formatting = {
                --     fields = { "abbr", "menu", "kind" },
                --     format = function(entry, item)
                --         local short_name = {
                --             nvim_lsp = "LSP",
                --             nvim_lua = "nvim",
                --         }
                --         local menu_name = short_name[entry.source.name] or entry.source.name
                --         item.menu = string.format("[%s]", menu_name)
                --         return item
                --     end,
                -- },
                -- formatting = require("lsp-zero").cmp_format(),
                formatting = {
                    with_text = false,
                    fields = { "kind", "abbr", "menu" },
                    format = require("lspkind").cmp_format({
                        mode = "symbol", -- show only symbol annotations
                        maxwidth = 50, -- prevent the popup from showing more than provided characters
                        ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
                        symbol_map = { Codeium = "" },
                        --             menu = {
                        --                 nvim_lsp = "[LSP]",
                        --                 -- luasnip = "[LuaSnip]",
                        --                 -- rg = "[RipG]",
                        --                 -- nvim_lua = "[Lua]",
                        --                 buffer = "[Buf]",
                        --                 emoji = "[Emoji]",
                        --                 spell = "[Spell]",
                        --                 path = "[Path]",
                        --                 neorg = "[Neorg]",
                        --                 snippy = "[Snippy]",
                        --                 math = "[Calc]",
                        --                 -- fuzzy_path = "[Fz_path]",
                        --                 -- latex_symbols = "[Latex]",
                        --             },
                    }),
                },
                experimental = {
                    ghost_text = true,
                },

                -- view = {
                --     entries = "native", -- can be "custom", "wildmenu" or "native"
                --     -- entries = { name = "custom", selection_order = "near_cursor" },
                -- },
                sources = cmp.config.sources({
                    { name = "snippy" }, -- For snippy users.
                    { name = "nvim_lsp" },
                    -- { name = 'vsnip' }, -- For vsnip users.
                    -- { name = "luasnip" }, -- For luasnip users.
                    -- { name = "luasnip", option = { show_autosnippets = true } },
                    -- { name = 'luasnip_choice' },
                    -- { name = 'ultisnips' }, -- For ultisnips users.
                }, {
                    { name = "buffer" },
                    { name = "spell" },
                    { name = "emoji" },
                    { name = "rg" },
                    -- { name = "fuzzy_buffer" },
                    { name = "async_path" },
                    { name = "path" },

                    -- { name = 'digraphs' }, --
                    -- { name = "neorg" },
                    { name = "calc" },
                    { name = "codeium" },
                }),
            })
        end,
    },
}

return M
