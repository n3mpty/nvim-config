local status_ok, material = pcall(require, "material")
if not status_ok then
    vim.notify("Failed loading " .. req_file, vim.log.levels.ERROR)
    return
end

vim.g.material_style = "darker"
material.setup({
    contrast = {
        sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
        floating_windows = false, -- Enable contrast for floating windows
        cursor_line = false, -- Enable darker background for the cursor line
        non_current_windows = true, -- Enable darker background for non-current windows
        popup_menu = false, -- Enable lighter background for the popup menu
    },

    italics = {
        comments = true, -- Enable italic comments
        keywords = false, -- Enable italic keywords
        functions = true, -- Enable italic functions
        strings = false, -- Enable italic strings
        variables = false, -- Enable italic variables
    },

    contrast_filetypes = { -- Specify which filetypes get the contrasted (darker) background
        "terminal", -- Darker terminal background
        "packer", -- Darker packer background
        "qf", -- Darker qf list background
    },

    high_visibility = {
        lighter = false, -- Enable higher contrast text for lighter style
        darker = true, -- Enable higher contrast text for darker style
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

    custom_highlights = {
        String = { fg = "#81a97b" },
        TSField = { fg = "#52719d" },
        TSVariableBuiltin = { fg = "#c94f6d" },
        --
        HopNextKey = { fg = "#F72626", bold = true },
        HopNextKey1 = { fg = "#F76726", bold = true },
        HopNextKey2 = { fg = "#3374CA" },
        --
        NormalFloat = { bg = "NONE" },
        --
        WinBar = { fg = "NONE", bg = "NONE", bold = false },
        WinBarNC = { fg = "NONE", bg = "NONE", bold = false },
        --
        CursorLine = { fg = "NONE", bg = "#141414" },
        CursorColumn = { bg = "#1F1A1A" },
        --
        TabLineFill = { fg = "#b0bec5" },
        TabLineSel = { bg = "#FF9800", fg = "#212121" },
        Tabline = { fg = "#b0bec5" },
        --
        BufferLineIndicatorSelected = { fg = "#FF9800" },
        BufferLineFill = { bg = "#212121" },
    }, -- Overwrite highlights with your own

    plugins = { -- Here, you can disable(set to false) plugins that you don't use or don't want to apply the theme to
        trouble = true,
        nvim_cmp = true,
        neogit = true,
        gitsigns = true,
        git_gutter = true,
        telescope = true,
        nvim_tree = false,
        sidebar_nvim = false,
        lsp_saga = true,
        nvim_dap = true,
        nvim_navic = false,
        which_key = true,
        sneak = true,
        hop = false,
        indent_blankline = true,
        nvim_illuminate = true,
        mini = true,
    },

    --
})

vim.cmd("colorscheme material")
