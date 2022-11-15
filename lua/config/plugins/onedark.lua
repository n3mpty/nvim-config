local status__ok, onedark = pcall(require, "onedarkpro")
if not status__ok then
    vim.notify("Failed loading " .. req_file, vim.log.levels.ERROR)
    return
end

onedark.setup({
    dark_theme = "onedark_dark", -- The default dark theme
    light_theme = "onelight", -- The default light theme
    caching = false, -- Use caching for the theme?
    cache_path = vim.fn.expand(vim.fn.stdpath("cache") .. "/onedarkpro/"), -- The path to the cache directory
    colors = {}, -- Override default colors by specifying colors for 'onelight' or 'onedark' themes
    highlights = {
        BufferLineBuffer = { fg = "#b0bec5", bg = "#181818" },
        BufferLineBufferVisible = { fg = "#515151", bg = "#181818" },
        BufferLineBufferSelected = { bg = "#181818", style = "bold" },
        BufferLineCloseButton = { fg = "#515151", bg = "#181818" },
        BufferLineBackground = { fg = "#515151", bg = "#181818" },
        BufferLineCloseButtonSelected = { bg = "#181818" },
        BufferLineCloseButtonVisible = { bg = "#181818" },
        --
        BufferLineSeparator = { fg = "#121212", bg = "#181818" },
        BufferLineSeparatorVisible = { fg = "#121212", bg = "#181818" },
        BufferLineSeparatorSelected = { fg = "#121212", bg = "#181818" },
        BufferLineOffsetSeparator = { fg = "#181818", bg = "#181818" },
        -- --
        BufferLineIndicatorSelected = { fg = "#181818", bg = "#181818" },
        BufferLineIndicatorVisible = { fg = "#181818", bg = "#181818" },
        BufferLineFill = { bg = "#212121" },
        --
        BufferLineTab = { fg = "#515151", bg = "#181818" },
        BufferLineTabClose = { fg = "#515151", bg = "#181818" },
        BufferLineTabSeparator = { fg = "#121212", bg = "#181818" },
        BufferLineTabSeparatorSelected = { fg = "#121212", bg = "#212121" },
        BufferLineTabSelected = { bg = "#212121" },
        --
        BufferLineModified = { fg = "green", bg = "#181818" },
        BufferLineModifiedVisible = { link = "BufferLineModified" },
        BufferLineModifiedSelected = { link = "BufferLineModified" },
    }, -- Override default highlight and/or filetype groups
    filetypes = { -- Override which filetype highlight groups are loaded
        javascript = true,
        lua = true,
        markdown = true,
        php = true,
        python = true,
        ruby = true,
        rust = true,
        toml = true,
        vue = true,
        yaml = true,
    },
    plugins = { -- Override which plugin highlight groups are loaded
        -- See the Supported Plugins section for a list of available plugins
    },
    styles = { -- Choose from "bold,italic,underline"
        types = "bold", -- Style that is applied to types
        numbers = "NONE", -- Style that is applied to numbers
        strings = "NONE", -- Style that is applied to strings
        comments = "NONE", -- Style that is applied to comments
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

        cursorline = false, -- Use cursorline highlighting?
        transparency = true, -- Use a transparent background?
        terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
        window_unfocused_color = false, -- When the window is out of focus, change the normal background?
    },
})
