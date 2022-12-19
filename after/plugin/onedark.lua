local status_ok, onedark = pcall(require, "onedarkpro")
if not status_ok then
    vim.notify("Failed loading " .. req_file, vim.log.levels.ERROR)
    return
end

local color = require("onedarkpro.lib.color")

onedark.setup({
    theme = "onedark",
    caching = true, -- Enable caching
    colors = {},
    highlights = {
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
        ["@field.lua"] = { fg = "#515a7c" },
    },
    filetypes = {

    },
    plugins = { -- Override which plugin highlight groups are loaded
        -- See the 'Supported plugins' section for the available list
        hop = false,
        barbar = false,
    },
    styles = { -- For example, to apply bold and italic, use "bold,italic"
        types = "bold", -- Style that is applied to types
        numbers = "NONE", -- Style that is applied to numbers
        strings = "NONE", -- Style that is applied to strings
        comments = "italic", -- Style that is applied to comments
        keywords = "NONE", -- Style that is applied to keywords
        constants = "NONE", -- Style that is applied to constants
        functions = "NONE", -- Style that is applied to functions
        operators = "bold", -- Style that is applied to operators
        variables = "NONE", -- Style that is applied to variables
        conditionals = "NONE", -- Style that is applied to conditionals
        virtual_text = "NONE", -- Style that is applied to virtual text
    },
    options = {
        bold = true, -- Use bold styles?
        italic = true, -- Use italic styles?
        underline = true, -- Use underline styles?
        undercurl = false, -- Use undercurl styles?

        cursorline = true, -- Use cursorline highlighting?
        transparency = true, -- Use a transparent background?
        terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
        highlight_inactive_windows = false, -- When the window is out of focus, change the normal background?
    }
})


vim.cmd("colorscheme onedark")
