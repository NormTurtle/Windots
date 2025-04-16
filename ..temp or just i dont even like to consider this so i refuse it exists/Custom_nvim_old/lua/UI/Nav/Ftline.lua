-- Better way to highlight F f T t key(search)
return {

    { -- Leap on Line
        "jinh0/eyeliner.nvim",
        keys = { "f", "F", "t", "T" },
        cmd = "EyelinerToggle",
        config = function()
            require("eyeliner").setup({
                highlight_on_key = true, -- show highlights only after keypress
                dim = true, -- dim all other characters if set to true (recommended!)
            })
        end,
    },
}
