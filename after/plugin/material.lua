local status_ok, material = pcall(require, "material")
if not status_ok then
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
    functions = {},
    variables = {},
    operators = {},
    types = { bold = true },
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
    "hop",
    -- "indent-blankline",
    -- "lspsaga",
    -- "mini",
    -- "neogit",
    -- "nvim-cmp",
    -- "nvim-navic",
    "nvim-tree",
    -- "sneak",
    "telescope",
    "trouble",
    -- "which-key",
  },
  --
  custom_highlights = {
  },
  --
  custom_colors = function(colors)
    colors.white = "#FAFAFA"
    colors.gray = "#546E7A"
    colors.black = "#000000"
    colors.red = "#EF5350"
    colors.green = "#AED581"
    colors.yellow = "#FDD835"
    colors.blue = "#42A5F5"
    colors.paleblue = "#97c3e4"
    colors.cyan = "#4DD0E1"
    colors.purple = "#BA68C8"
    colors.orange = "#F57C00"
    --
    colors.darkred = "#C62828"
    colors.darkgreen = "#2E7D32"
    colors.darkyellow = "#F9A825"
    colors.darkblue = "#1565C0"
    colors.darkcyan = "#0097A7"
    colors.darkpurple = "#7B1FA2"
    colors.darkorange = "#EF6C00"
  end,
})

vim.g.material_style = "darker"
-- vim.cmd("colorscheme material")
