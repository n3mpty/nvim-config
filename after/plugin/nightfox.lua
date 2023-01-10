local status_ok, nightfox = pcall(require, "nightfox")
if not status_ok then
  return
end


local Color = require("nightfox.lib.color")


nightfox.setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = false, -- Disable setting background
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
      nvimtree = {
        enable = false,
        background = false,
      }
    },
  },
  palettes = {
    nightfox = {
    }
  },
  specs = {},
  groups = {
    nightfox = {
    },
  },
})

-- vim.cmd("colorscheme nightfox")
