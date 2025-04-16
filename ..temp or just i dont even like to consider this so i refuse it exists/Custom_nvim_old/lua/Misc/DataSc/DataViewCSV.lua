--         ╭──────────────────────────────────────────────────────────╮
--         │                     csv , tsv viewer                     │
--         ╰──────────────────────────────────────────────────────────╯
M = {
    {
        "vidocqh/data-viewer.nvim",
        opts = {
            autoDisplayWhenOpenFile = false,
            maxLineEachTable = 100,
            columnColorEnable = true,
            columnColorRoulette = { -- Highlight groups
                "DataViewerColumn0",
                "DataViewerColumn1",
                "DataViewerColumn2",
            },
            view = {
                width = 0.8, -- Less than 1 means ratio to screen width
                height = 0.8, -- Less than 1 means ratio to screen height
                zindex = 50,
                float = false,
            },
            keymap = {
                quit = "q",
                next_table = "<TAB>",
                prev_table = "<S-TAB>",
            },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "kkharji/sqlite.lua", -- Optional, sqlite support
        },
    },
}
return M
