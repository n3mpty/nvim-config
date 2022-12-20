local status_ok, nightfox = pcall(require, "nightfox")
if not status_ok then
    vim.notify("Failed loading " .. req_file, vim.log.levels.ERROR)
    return
end

--[[ #0C0603 ]]
local palletes = {
    nightfox = {
        red = "#CD3543",
        green = "#58D8BC",
        yellow = "#F4BA60",
        blue = "#1CB7BB",
        magenta = "#7E2882",
        cyan = "#70cddc",
        white = "#dfdfe0",
        orange = "#C3642E",
        pink = "#9D4376",

    }
}

nightfox.setup({
    options = {
        -- Compiled file's destination location
        compile_path = vim.fn.stdpath("cache") .. "/nightfox",
        compile_file_suffix = "_compiled", -- Compiled file suffix
        transparent = true, -- Disable setting background
        terminal_colors = false, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
        dim_inactive = false, -- Non focused panes set to alternative background
        module_default = true,
        styles = { -- Style to be applied to different syntax groups
            comments = "italic", -- Value is any valid attr-list value `:help attr-list`
            conditionals = "NONE",
            constants = "NONE",
            functions = "NONE",
            keywords = "NONE",
            numbers = "NONE",
            operators = "NONE",
            strings = "NONE",
            types = "bold",
            variables = "NONE",
        },
        inverse = { -- Inverse highlight for different types
            match_paren = false,
            visual = false,
            search = false,
        },
        modules = {
            whichkey = {
                enable = false,
                background = true,
            },
            barbar = {
                enable = false,
            },
        },
    },
    palettes = {palletes},
    specs = {},
    groups = {
        all = {
            String = { fg = "#767b71" },
            Comment = { fg = "#5a6369" },
            ["@variable"] = { fg = "#a3a3a3" },
            ["@field"] = { fg = "#3e4d84" },
            --
            HopNextKey = { fg = "#F72626", style = "bold" },
            HopNextKey1 = { fg = "#F76726", style = "bold" },
            HopNextKey2 = { fg = "#3374CA" },
            --
            CursorLine = { fg = "NONE", bg = "#222222" },
            CursorColumn = { fg = "NONE", bg = "#222222" },
            CursorLineNr = { fg = "#900e0e", bg = "NONE" },
            --
            Visual = { fg = "NONE", bg = "#3F3F3F", style = "bold,italic" },
            --
            --
            NormalFloat = { bg = "#0a0a0a" },
            FloatBorder = { fg = "#0a0a0a", bg = "#0a0a0a" },


            
            DiagnosticVirtualTextError = { bg = "NONE", style = "bold" },
            DiagnosticVirtualTextWarn = { bg = "NONE", style = "bold" },
            DiagnosticVirtualTextInfo = { bg = "NONE", style = "bold" },
            DiagnosticVirtualTextHint = { bg = "NONE", style = "bold" },
        },
    },
})
