local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local lsp_progress = {
	function(_)
		local result = vim.lsp.util.get_progress_messages()[1]

		if result then
			local msg = result.message or ""
			local percentage = result.percentage or 0
			local title = result.title or ""

			local spinners = { "", "", "" }
			local success_icon = { "", "", "" }

			local ms = vim.loop.hrtime() / 1000000
			local frame = math.floor(ms / 120) % #spinners

			if percentage >= 70 then
				return string.format(" %%<%s %s %s (%s%%%%) ", success_icon[frame + 1], title, msg, percentage)
			end

			return string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)
		end

		return ""
	end,
}

local lsp_info = {
	function(msg)
		msg = msg or "LS Inactive"
		local buf_clients = vim.lsp.buf_get_clients()
		-- local clients = vim.lsp.get_active_clients()
		if next(buf_clients) == nil then
			-- TODO: clean up this if statement
			if type(msg) == "boolean" or #msg == 0 then
				return "LS Inactive"
			end
			return msg
		end
		local buf_client_names = {}

		-- add client
		for _, client in pairs(buf_clients) do
			if client.name ~= "null-ls" then
				table.insert(buf_client_names, client.name)
			end
		end

		-- local ignore_list = { 'null-ls', 'gitsigns' }
		-- local available_source = require 'null-ls.sources'.list_registered(buf_ft)
		-- local null_ls_names = {}
		--
		-- for _, source in pairs(available_source) do
		--   if not vim.tbl_contains(null_ls_names, source.name) and not vim.tbl_contains(ignore_list, source.name) then
		--     table.insert(null_ls_names, source.name)
		--   end
		-- end
		--
		-- vim.list_extend(buf_client_names, null_ls_names)

		return " " .. table.concat(buf_client_names, ", ") .. ""
	end,
	color = { gui = "bold" },
	cond = hide_in_width,
	icon = "",
}

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = true,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = true,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
}

local mode = {
	"mode",
}

local filetype = {
	"filetype",
	icons_enabled = true,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local colors = {
	blue = "#2C71CF",
	cyan = "#79dac8",
	black = "#080808",
	white = "#c6c6c6",
	red = "#CF2C2C",
	violet = "#d183e8",
	grey = "#2A2A2B",
	green = "#3CCF2C",
	purple = "#6D3BB7",
}

local theme = {
	normal = {
		a = { fg = colors.black, bg = colors.red },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.white, bg = colors.black },
		x = { fg = colors.black, bg = colors.black },
		y = { fg = colors.white, bg = colors.grey },
		z = { fg = colors.black, bg = colors.red },
	},
	insert = {
		a = { fg = colors.black, bg = colors.green },
		-- b = { fg = colors.black, bg = colors.blue },
		-- c = { fg = colors.black, bg = colors.blue },
		-- x = { fg = colors.black, bg = colors.blue },
		-- y = { fg = colors.black, bg = colors.blue },
		z = { fg = colors.black, bg = colors.green },
	},
	visual = {
		a = { fg = colors.black, bg = colors.purple },
		-- b = { fg = colors.black, bg = colors.blue },
		-- c = { fg = colors.black, bg = colors.blue },
		-- x = { fg = colors.black, bg = colors.blue },
		-- y = { fg = colors.black, bg = colors.blue },
		-- z = { fg = colors.black, bg = colors.blue },
	},
	command = {
		a = { fg = colors.white, bg = colors.black },
		-- b = { fg = colors.black, bg = colors.blue },
		-- c = { fg = colors.black, bg = colors.blue },
		-- x = { fg = colors.black, bg = colors.blue },
		-- y = { fg = colors.black, bg = colors.blue },
		-- z = { fg = colors.black, bg = colors.blue },
	},
	inactive = {
		a = { fg = colors.white, bg = colors.black },
		-- b = { fg = colors.black, bg = colors.blue },
		-- c = { fg = colors.black, bg = colors.blue },
		-- x = { fg = colors.black, bg = colors.blue },
		-- y = { fg = colors.black, bg = colors.blue },
		-- z = { fg = colors.black, bg = colors.blue },
	},
}

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = theme,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "NvimTree", "Outline", "TelescopePrompt", "TelescopeResults" },
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { branch, diff },
		lualine_c = { "filename", lsp_progress },
		lualine_x = {},
		lualine_y = { diagnostics, lsp_info, filetype, "progress" },
		lualine_z = { spaces, "location" },
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { "nvim-tree" },
})
