local status_ok, nightfox = pcall(require, "nightfox")
if not status_ok then
	return
end

local cmd = vim.cmd
local g = vim.g

nightfox.setup({
    groups = {
      all = {
      CursorLine = { fg="", bg = "#000000"},
      CursorColumn = { bg = "#1F1A1A"},
      --
      HopNextKey = { fg = "#F72626", style = "bold"},
      HopNextKey1 = { fg = "#F76726", style = "bold"},
      HopNextKey2 = { fg = "#3374CA" },
      --
      -- TabLine = { bg = "Black"},
      -- TabLineFill = { bg = "Black"},
      -- TabLineSel = { bg = "Black"},
      -- 
      NormalFloat = { bg = "NONE" },
      --
      SignatureMarkLine = { bg = "#474747" },
      SignatureMarkText = { fg = "#474747" },
      --
      Visual = { fg = "NONE", bg = "#5c2b2b" },
      VisualNOS = { fg = "NONE", bg = "#5c2b2b" },
      Search = { fg = "#d3dbd9", bg = "#5fa38d" },
      IncSearch = { fg = "#d3dbd9", bg = "#5fa38d" },
      ---
      
    }
  },
	options = {
		transparent = true,
		styles = {
			comments = "italic",
		},
	},
    specs = {
      carbonfox = {
      diag = {
        error = "#E12B21",
        warn = "#E19921",
      },
      diag_bg = {
        error = "NONE",
        warn = "NONE",
        info = "NONE",
        hint = "NONE",
      },
      syntax = {
        string = "#90F7A1"
      },
    }
  }
})


cmd("colorscheme carbonfox")

-- g.tokyonight_style = "night"
-- g.tokyonight_terminal_colors = true
-- g.tokyonight_italic_comments = true
-- g.tokyonight_italic_keywords = false
-- g.tokyonight_italic_functions = false
-- g.tokyonight_italic_variables = false
-- g.tokyonight_transparent = true
-- g.tokyonight_transparent_sidebar = true
-- g.tokyonight_dark_sidebar = true
-- g.tokyonight_dark_float = true
