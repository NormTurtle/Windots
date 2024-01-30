return {

    {
        "gera2ld/ai.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        opts = {
            api_key = "", -- or read from env: `os.getenv('GEMINI_API_KEY')`
            -- The locale for the content to be defined/translated into
            locale = "en",
            -- The locale for the content in the locale above to be translated into
            alternate_locale = "hi",
            -- Define custom prompts here, see below for more details
            prompts = {},
        },
        event = "VeryLazy",
    },
}
