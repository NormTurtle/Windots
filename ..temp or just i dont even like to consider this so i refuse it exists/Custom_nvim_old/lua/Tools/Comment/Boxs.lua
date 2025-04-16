--         ╭──────────────────────────────────────────────────────────╮
--         │                    Beautify comments                     │
--         ╰──────────────────────────────────────────────────────────╯
--  ──────────────────────────────────────────────────────────────────────
M = {
    {
        "LudoPinelli/comment-box.nvim",
        cmd = {
            -- Boxes
            "CBllbox", -- Left aligned box of fixed size with Left aligned text
            "CBlcbox", -- Left aligned box of fixed size with Centered text
            "CBlrbox", -- Left aligned box of fixed size with Right aligned text
            "CBclbox", -- Centered box of fixed size with Left aligned text
            "CBccbox", -- Centered box of fixed size with Centered text
            "CBcrbox", -- Centered box of fixed size with Right aligned text
            "CBrlbox", -- Right aligned box of fixed size with Left aligned text
            "CBrcbox", -- Right aligned box of fixed size with Centered text
            "CBrrbox", -- Right aligned box of fixed size with Right aligned text
            "CBalbox", -- Left aligned adapted box
            "CBacbox", -- Centered adapted box
            "CBarbox", -- Right aligned adapted box
            -- Lines
            "CBline", -- Left aligned line
            "CBcline", -- Centered line
            "CBrline", -- Right aligned line
            "CBcatalog", -- Type of lines and boxes , not workignin window
        },
        -- default config if change delete this line
        opts = {
            doc_width = 80, -- width of the document
            box_width = 60, -- width of the boxes
            borders = { -- symbols used to draw a box
                top = "─",
                bottom = "─",
                left = "│",
                right = "│",
                top_left = "╭",
                top_right = "╮",
                bottom_left = "╰",
                bottom_right = "╯",
            },
            line_width = 70, -- width of the lines
            line = { -- symbols used to draw a line
                line = "─",
                line_start = "─",
                line_end = "─",
            },
            outer_blank_lines = false, -- insert a blank line above and below the box
            inner_blank_lines = false, -- insert a blank line above and below the text
            line_blank_line_above = false, -- insert a blank line above the line
            line_blank_line_below = false, -- insert a blank line below the line
        },
    },
}
return M
