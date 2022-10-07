local status__ok, tokyonight = pcall(require, "tokyonight")
if not status__ok then
	vim.notify("Failed loading " .. req_file, vim.log.levels.ERROR)
	return
end

tokyonight.setup({
	style = "night",
	transparent = true,
	terminal_colors = true,
	styles = {
		comments = {},
		keywords = {},
		functions = {},
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
			bg = "#0f0b0b",
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
