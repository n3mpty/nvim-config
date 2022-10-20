local status_ok, material = pcall(require, "material")
if not status_ok then
    vim.notify("Failed loading " .. req_file, vim.log.levels.ERROR)
    return
end

local colors = require("material.colors")

material.setup({
    contrast = {
        terminal = false, -- Enable contrast for the built-in terminal
        sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
        floating_windows = false, -- Enable contrast for floating windows
        cursor_line = false, -- Enable darker background for the cursor line
        non_current_windows = false, -- Enable darker background for non-current windows
        filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
    },

    styles = { -- Give comments style such as bold, italic, underline etc.
        comments = { italic = true },
        strings = {},
        keywords = {},
        functions = { italic = true },
        variables = {},
        operators = { bold = true },
        types = {},
    },

    high_visibility = {
        lighter = false, -- Enable higher contrast text for lighter style
        darker = false, -- Enable higher contrast text for darker style
    },

    disable = {
        colored_cursor = true, -- Disable the colored cursor
        borders = false, -- Disable borders between verticaly split windows
        background = true, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
        term_colors = false, -- Prevent the theme from setting terminal colors
        eob_lines = false, -- Hide the end-of-buffer lines
    },

    lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )
    async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)
    plugins = { -- Uncomment the plugins that you use to highlight them
        -- Available plugins:
        -- "dap",
        -- "dashboard",
        "gitsigns",
        -- "hop",
        "indent-blankline",
        -- "lspsaga",
        -- "mini",
        -- "neogit",
        "nvim-cmp",
        -- "nvim-navic",
        "nvim-tree",
        -- "sneak",
        "telescope",
        "trouble",
        "which-key",
    },
    --
    custom_highlights = {
        String = { fg = "#90a97b" },
        ["@variable.builtin"] = { fg = "#f7768e" },
        ["@field"] = { fg = "#2c3559" },
        ["@parameter"] = { fg = "#ad8d59" },
        ["@parameter.reference"] = { link = "@parameter" },

        HopNextKey = { fg = "#F72626", bold = true },
        HopNextKey1 = { fg = "#F76726", bold = true },
        HopNextKey2 = { fg = "#3374CA" },

        NormalFloat = { bg = "NONE" },

        WinBar = { fg = "NONE", bg = "NONE", bold = false },
        WinBarNC = { fg = "NONE", bg = "NONE", bold = false },

        CursorLine = { fg = "NONE", bg = "#1e1e1e" },
        CursorColumn = { fg = "NONE", bg = "#1e1e1e" },

        -- TabLineFill = { fg = "#b0bec5" },
        -- TabLineSel = { bg = "#FF9800", fg = "#212121" },
        -- Tabline = { fg = "#b0bec5" },

        -- BufferLineIndicatorSelected = { fg = "#FF9800" },
        -- BufferLineFill = { bg = "#212121" },
        --
        -- DiagnosticUnderlineError = { underline = true, sp = "#ff5370" },
        -- DiagnosticUnderlineWarn = { underline = true, sp = "#ffcb6b" },
        -- DiagnosticUnderlineHint = { underline = true, sp = "#c792ea" },
        -- DiagnosticUnderlineInfo = { underline = true, sp = "#b0c9ff" },
    },
    --
    -- custom_colors = function(colors)
    --     colors.editor.fg_dark = "#2c3559"
    --     colors.syntax.string = "#90a97b"
    -- end,
})

vim.g.material_style = "darker"
vim.cmd("colorscheme material")
