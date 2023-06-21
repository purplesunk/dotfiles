require("catppuccin").setup({
    flavour = "macchiato",
    background = { -- :h background
        light = "latte",
        dark = "macchiato",
    },
    transparent_background = false,
    show_end_of_buffer = true, -- show the '~' characters after the end of buffers
    term_colors = false,
    no_italic = true, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
        cmp = true,
        neotree = true,
        telescope = true,
        mason = true,
        treesitter = true,
        which_key = true,
    },
})

vim.cmd.colorscheme('catppuccin')
