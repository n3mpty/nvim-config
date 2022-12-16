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
		String = { fg = "#738091" },
		["@field"] = { fg = "#2c3852" },
		["@parameter"] = { fg = "#ad8d59" },
		["@parameter.reference"] = { link = "@parameter" },

		HopNextKey = { fg = "#F72626", bold = true },
		HopNextKey1 = { fg = "#F76726", bold = true },
		HopNextKey2 = { fg = "#3374CA" },

		CursorLine = { fg = "NONE", bg = "#222222" },
		CursorColumn = { fg = "NONE", bg = "#222222" },
		--
		Visual = { bg = "#424242", bold = true, italic = true },
		--
		DiagnosticUnderlineError = { undercurl = true, sp = "#99000b" },
		DiagnosticUnderlineWarn = { undercurl = true, sp = "#994400" },
		DiagnosticUnderlineHint = { undercurl = true, sp = "#990077" },
		DiagnosticUnderlineInfo = { undercurl = true, sp = "#004399" },
	},
	--
	custom_colors = function(colors)
		colors.white = "#EEFFFF"
		colors.gray = "#7c8fa9"
		colors.black = "#000000"
		colors.red = "#ec5459"
		colors.green = "#cee1ca"
		colors.yellow = "#ffcc83"
		colors.blue = "#6295ff"
		colors.paleblue = "#97c3e4"
		colors.cyan = "#006d74"
		colors.purple = "#ae82b2"
		colors.orange = "#F78C6C"
		--
		colors.darkred = "#d74a4e"
		colors.darkgreen = "#c7c977"
		colors.darkyellow = "#eab65e"
		colors.darkblue = "#7b9cde"
		colors.darkcyan = "#a5c2df"
		colors.darkpurple = "#af8cb2"
		colors.darkorange = "#c98a5c"
	end,
})

vim.g.material_style = "darker"
