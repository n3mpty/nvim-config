local status_ok, onedark = pcall(require, "onedarkpro")
if not status_ok then
    vim.notify("Failed loading " .. req_file, vim.log.levels.ERROR)
    return
end

local color = require("onedarkpro.lib.color")

local palette = {
    bg = "#282c34",
    fg = "#abb2bf",
    red = "#ef7385",
    orange = "#d19a66",
    yellow = "#e5c07b",
    green = "#95ca87",
    cyan = "#70bfc5",
    blue = "#7cbbef",
    purple = "#d77fde",
    white = "#abb2bf",
    black = "#282c34",
    gray = "#5c6370",
    highlight = "#e2be7d",
    comment = "#7f848e",
    none = "NONE",
}
onedark.setup({
    theme = "onedark_dark",
    caching = true, -- Enable caching
    colors = {
        onedark_dark = {
            color.darken(palette.red, 0.85),
            color.darken(palette.orange, 0.70),
            color.darken(palette.yellow, 0.70),
            color.darken(palette.green, 0.70),
            color.darken(palette.cyan, 0.70),
            color.darken(palette.blue, 0.70),
            color.darken(palette.purple, 0.65),
            color.darken(palette.white, 0.70),
            color.darken(palette.gray, 0.70),
        }
    },
    highlights = {
        Keyword = { fg = "#bf6e3d" },
        ["@string"] = { fg = "#767b71" },
        ["@variable"] = { fg = "#a3a3a3" },
        Comment = { fg = "#5a6369", styles = "italic" },
        ---
        CursorLine = { fg = "NONE", bg = "#222222" },
        CursorColumn = { fg = "NONE", bg = "#222222" },
        CursorLineNr = { fg = "#9c5269", bg = "NONE" },
        PmenuSel = { bg = "#222222" },
        --
        HopNextKey = { fg = "#F72626", style = "bold" },
        HopNextKey1 = { fg = "#F76726", style = "bold" },
        HopNextKey2 = { fg = "#3374CA" },
        --
        ["@conditional"] = { fg = "#de7f84" },
        ["@repeat"] = { link = "@conditional" },
        ["@keyword.operator"] = { fg = "#de7f84" },
        ["@keyword.function"] = { fg = "#de7f84" },
        ["@conditional.python"] = { link = "@conditional" },
        ["@field.lua"] = { fg = "#515a7c" },
        ["@keyword.rust"] = { fg = "#bf6e3d" },
    },
    filetypes = {

    },
    plugins = { -- Override which plugin highlight groups are loaded
        -- See the 'Supported plugins' section for the available list
        hop = false,
        barbar = false,
        whichkey = false,
    },
    styles = { -- For example, to apply bold and italic, use "bold,italic"
        types = "bold", -- Style that is applied to types
        numbers = "NONE", -- Style that is applied to numbers
        strings = "NONE", -- Style that is applied to strings
        comments = "italic", -- Style that is applied to comments
        keywords = "NONE", -- Style that is applied to keywords
        constants = "NONE", -- Style that is applied to constants
        functions = "NONE", -- Style that is applied to functions
        operators = "NONE", -- Style that is applied to operators
        variables = "NONE", -- Style that is applied to variables
        conditionals = "NONE", -- Style that is applied to conditionals
        virtual_text = "NONE", -- Style that is applied to virtual text
    },
    options = {
        bold = true, -- Use bold styles?
        italic = true, -- Use italic styles?
        underline = true, -- Use underline styles?
        undercurl = true, -- Use undercurl styles?

        cursorline = true, -- Use cursorline highlighting?
        transparency = true, -- Use a transparent background?
        terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
        highlight_inactive_windows = false, -- When the window is out of focus, change the normal background?
    }
})


vim.cmd("colorscheme onedark_dark")
