local status_ok, nightfox = pcall(require, "nightfox")
if not status_ok then
      vim.notify('Failed loading ' .. req_file, vim.log.levels.ERROR)
	return
end

local status_catpputin_ok, catppuccin = pcall(require, "catppuccin")
if not status_catpputin_ok then
      vim.notify('Failed loading ' .. req_file, vim.log.levels.ERROR)
	return
end

local status_tokyonight_ok, tokyonight = pcall(require, "tokyonight")
if not status_catpputin_ok then
      vim.notify('Failed loading ' .. req_file, vim.log.levels.ERROR)
	return
end

local cmd = vim.cmd
local g = vim.g
tokyonight.setup({
	style = "night",
	transparent = true,
	terminal_colors = true,
	styles = {
		comments = { italic = true },
		keywords = {  },
		functions = { italic = true },
		variables = {},
		--
		sidebars = "transparent",
		floats = "transparent",
	},
	sidebars = { "qf", "help", "nvim-tree", "packer" },
	---- override
	on_highlights = function(hl, c)
		local prompt = "#2d3149"
		-- [[ hl.TelescopeNormal = { ]]
		--[[ 	bg = c.bg_dark, ]]
		--[[ 	fg = c.fg_dark, ]]
		--[[ } ]]
		--[[ hl.TelescopeBorder = { ]]
		--[[ 	bg = c.bg_dark, ]]
		--[[ 	fg = c.bg_dark, ]]
		--[[ } ]]
		--[[ hl.TelescopePromptNormal = { ]]
		--[[ 	bg = prompt, ]]
		--[[ } ]]
		--[[ hl.TelescopePromptBorder = { ]]
		--[[ 	bg = prompt, ]]
		--[[ 	fg = prompt, ]]
		--[[ } ]]
		--[[ hl.TelescopePromptTitle = { ]]
		--[[ 	bg = prompt, ]]
		--[[ 	fg = prompt, ]]
		--[[ } ]]
		--[[ hl.TelescopePreviewTitle = { ]]
		--[[ 	bg = c.bg_dark, ]]
		--[[ 	fg = c.bg_dark, ]]
		--[[ } ]]
		--[[ hl.TelescopeResultsTitle = { ]]
		--[[ 	bg = c.bg_dark, ]]
		--[[ 	fg = c.bg_dark, ]]
		--[[ } ]]
		--
		hl.String = {
			fg = "#AD8D59",
		}
		--
		hl.TSParameter = {
			fg = "#ff6961",
		}
		--
		hl.CursorLine = {
			fg = "NONE",
			bg = "#111111",
		}
		--
		hl.HopNextKey = {
			fg = "#F72626",
			bold = true,
		}
		hl.HopNextKey1 = {
			fg = "#F76726",
			bold = true,
		}
		hl.HopNextKey2 = {
			fg = "#3374CA",
		}
		--
		--[[ hl.NormalFloat = { ]]
		--[[ bg = "NONE"  ]]
		--[[ } ]]
		--
	end,
})

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

nightfox.setup({
	groups = {
		all = {
			--[[ String = { fg = "#C87648" }, ]]
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
			--[[ operators = "bold", ]]
			--[[ functions = "italic", ]]
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

--[[ g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha ]]
cmd("colorscheme tokyonight")
