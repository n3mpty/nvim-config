local status_ok, nightfox = pcall(require, "nightfox")
if not status_ok then
	vim.notify("Failed loading " .. req_file, vim.log.levels.ERROR)
	return
end

nightfox.setup({
	options = {
		-- Compiled file's destination location
		compile_path = vim.fn.stdpath("cache") .. "/nightfox",
		compile_file_suffix = "_compiled", -- Compiled file suffix
		transparent = true, -- Disable setting background
		terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
		dim_inactive = false, -- Non focused panes set to alternative background
		styles = { -- Style to be applied to different syntax groups
			comments = "italic", -- Value is any valid attr-list value `:help attr-list`
			conditionals = "NONE",
			constants = "NONE",
			functions = "italic",
			keywords = "NONE",
			numbers = "NONE",
			operators = "NONE",
			strings = "NONE",
			types = "NONE",
			variables = "NONE",
		},
		inverse = { -- Inverse highlight for different types
			match_paren = false,
			visual = false,
			search = false,
		},
		modules = { -- List of various plugins and additional options
			-- ...
		},
	},
	palettes = {},
	specs = {},
	groups = {
		all = {
			String = { fg = "#81a97b" },
			--
			HopNextKey = { fg = "#F72626", style = "bold" },
			HopNextKey1 = { fg = "#F76726", style = "bold" },
			HopNextKey2 = { fg = "#3374CA" },
			--
			NormalFloat = { bg = "NONE" },
			--
			WinBar = { fg = "NONE", bg = "NONE", style = "" }, 
			WinBarNC = { fg = "NONE", bg = "NONE", style = "" },
      --
      CursorLine = { fg = "NONE", bg = "#141414" },
      CursorColumn = { bg = "#1F1A1A" },
		},
	},
})

-- vim.cmd("colorscheme nightfox")

