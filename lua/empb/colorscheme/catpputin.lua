local status_catpputin_ok, catppuccin = pcall(require, "catppuccin")
if not status_catpputin_ok then
	vim.notify("Failed loading " .. req_file, vim.log.levels.ERROR)
	return
end


catppuccin.setup({
	transparent_background = true,
	term_colors = true,
	compile = {
		enabled = false,
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
			String = { fg = "#C87648" },
		},
	},

	custom_highlights = {
		String = { fg = "#C87648" },
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
	},
})
