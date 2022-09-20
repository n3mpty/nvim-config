local status_ok, nightfox = pcall(require, "nightfox")
if not status_ok then
	return
end

local status_catpputin_ok, catppuccin = pcall(require, "catppuccin")
if not status_catpputin_ok then
	return
end


local cmd = vim.cmd
local g = vim.g

catppuccin.setup({
	transparent_background = true,
	term_colors = true,
	compile = {
		enabled = true,
		path = vim.fn.stdpath("cache") .. "/catppuccin",
	},
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	styles = {
		comments = { "italic" },
		conditionals = {},
		loops = {},
		functions = { "bold" },
		keywords = { "italic" },
		strings = {},
		variables = {},
		numbers = {},
		booleans = { "italic" },
		properties = {},
		types = {},
		operators = { "bold" },
	},
	integrations = {
		-- For various plugins integrations see https://github.com/catppuccin/nvim#integrations
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "undercurl" },
				hints = { "undercurl" },
				warnings = { "undercurl" },
				information = { "undercurl" },
			},
		},
	},
	color_overrides = {},
	highlight_overrides = {
		syntax = {
			String = { fg = "#D8E3A1" },
		},
	},

	custom_highlights = {
		--
		CursorLine = { fg = "NONE", bg = "#222222" },
		CursorColumn = { bg = "#1F1A1A" },
		--
		HopNextKey = { fg = "#F72626", style = { "bold" } },
		HopNextKey1 = { fg = "#F76726", style = { "bold" } },
		HopNextKey2 = { fg = "#3374CA" },
		--
		NormalFloat = { bg = "NONE" },
		--
		SignatureMarkLine = { bg = "#474747" },
		SignatureMarkText = { fg = "#474747" },
	},
})

nightfox.setup({
	groups = {
		all = {
			String = { fg = "#D8E3A1" },
			--
			CursorLine = { fg = "NONE", bg = "#222222" },
			CursorColumn = { bg = "#1F1A1A" },
			--
			HopNextKey = { fg = "#F72626", style = { "bold" } },
			HopNextKey1 = { fg = "#F76726", style = { "bold" } },
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
			--[[ Visual = { fg = "NONE", bg = "#5c2b2b" }, ]]
			--[[ VisualNOS = { fg = "NONE", bg = "#5c2b2b" }, ]]
			--[[ Search = { fg = "#d3dbd9", bg = "#5fa38d" }, ]]
			--[[ IncSearch = { fg = "#d3dbd9", bg = "#5fa38d" }, ]]
			--
		},
	},
	options = {
		transparent = true,
		styles = {
			comments = "italic",
			keywords = "italic",
			operators = "bold",
			functions = "italic",
		},
	},
	specs = {
		nightfox = {
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
				string = "#90F7A1",
			},
		},
	},
})

g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
cmd("colorscheme catppuccin")

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
