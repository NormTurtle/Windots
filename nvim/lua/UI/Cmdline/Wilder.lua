--  Cmdline menu wilder
local wilder = require("wilder")
wilder.setup({
    modes = { ":", "/", "?" },
    --  next_key =  "<C-n>",
    -- previous_key = "<C-p>",
})

wilder.set_option(
    "renderer",
    wilder.popupmenu_renderer({
        pumblend = 35,
        highlighter = wilder.basic_highlighter(),
        left = { " ", wilder.popupmenu_devicons() },
        right = { " ", wilder.wildmenu_index() },
    })
)

-- issues
-- conflit  with hlsearch inchsearch
-- pipe issue
