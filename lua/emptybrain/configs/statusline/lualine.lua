local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end



local colors = {
	blue = "#3FCBFC",
	cyan = "#3FFCD5",
	black = "#000000",
	white = "#D4D4D4",
	red = "#FC3F3F",
	violet = "#E53FFC",
	grey = "#343434",
	green = "#3FFC4B",
	purple = "#EF3FFC",
    transparent = "NONE",
}

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

			local spinners = { "", " ", "" }
			local success_icon = { " ", " ", " " }

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
		msg = msg or "LS INACTIVE"
		local buf_clients = vim.lsp.buf_get_clients()
		if next(buf_clients) == nil then
			if type(msg) == "boolean" or #msg == 0 then
				return "LSP OFFLINE"
			end
			return msg
		end
		local buf_client_names = {}

        buf_ft = vim.bo.filetype
		-- add client
		for _, client in pairs(buf_clients) do
			if client.name ~= "null-ls" then
				table.insert(buf_client_names, client.name)
			end
		end
        

        local sources = require("null-ls.sources")
        local available_sources = sources.get_available(buf_ft)
        local registered = {}
        for _, source in ipairs(available_sources) do
            for method in pairs(source.methods) do
                registered[method] = registered[method] or {}
                table.insert(registered[method], source.name)
            end
        end

        local f = registered["NULL_LS_FORMATTING"]
        local linter = registered["NULL_LS_DIAGNOSTICS"]
        if f ~= nil then
            vim.list_extend(buf_client_names, f)
        end
        if linter ~= nil then
            vim.list_extend(buf_client_names, linter)
        end

		--[[ return "LSP ON" .. table.concat(buf_client_names, ", ") .. "" ]]
        
		return "LSP ON" 
	end,
	color = { gui = "bold" },
	cond = hide_in_width,
	icon = "",
}

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = true,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = true,
	symbols = { added = "+", modified = "~", removed = "-" }, -- changes diff symbols
}

local filetype = {
	"filetype",
	icons_enabled = true,
	icon = nil,
	-- color = { fg = colors.white, bg = colors.black },
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local python_env = {
	function()
		local utils = require("emptybrain.plugins.config.statusline.utils")
		if vim.bo.filetype == "python" then
			local venv = os.getenv("CONDA_DEFAULT_ENV")
			if venv then
				return string.format("  (%s)", utils.env_cleanup(venv))
			end
			venv = os.getenv("VIRTUAL_ENV")
			if venv then
				return string.format("  (%s)", utils.env_cleanup(venv))
			end
			return ""
		end
		return ""
	end,
	color = { fg = colors.green },
	cond = hide_in_width,
}
local theme = {
	normal = {
		a = { fg = colors.black, bg = colors.red },
		b = { fg = colors.white, bg = colors.black },
		c = { fg = colors.white, bg = colors.transparent },
		x = { fg = colors.white, bg = colors.transparent },
		y = { fg = colors.white, bg = colors.transparent },
		z = { fg = colors.black, bg = colors.red },
	},
	insert = {
		a = { fg = colors.black, bg = colors.green },
		-- b = { fg = colors.black, bg = colors.blue },
		c = { fg = colors.white, bg = colors.transparent },
		x = { fg = colors.white, bg = colors.transparent },
		y = { fg = colors.white, bg = colors.transparent },
		z = { fg = colors.white, bg = colors.transparent },
	},
	visual = {
		a = { fg = colors.black, bg = colors.purple },
		-- b = { fg = colors.black, bg = colors.blue },
		c = { fg = colors.white, bg = colors.transparent },
		x = { fg = colors.white, bg = colors.transparent },
		y = { fg = colors.white, bg = colors.transparent },
		-- z = { fg = colors.black, bg = colors.blue },
	},
	command = {
		a = { fg = colors.white, bg = colors.black },
		b = { fg = colors.white, bg = colors.black },
		c = { fg = colors.white, bg = colors.black },
		x = { fg = colors.white, bg = colors.black },
		y = { fg = colors.white, bg = colors.black },
		z = { fg = colors.white, bg = colors.black },
	},
	terminal = {
		a = { fg = colors.white, bg = colors.black },
		b = { fg = colors.white, bg = colors.black },
		c = { fg = colors.white, bg = colors.black },
		x = { fg = colors.white, bg = colors.black },
		y = { fg = colors.white, bg = colors.black },
		z = { fg = colors.white, bg = colors.black },
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


lualine.setup({
	options = {
		icons_enabled = true,
		theme = theme,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "NvimTree", "Outline", "TelescopePrompt", "TelescopeResults" },
	},
	sections = {
        lualine_a = { "mode" },
		lualine_b = { branch, diff },
		lualine_c = { "filename", python_env },
		lualine_x = {  },
		lualine_y = { diagnostics, "filetype", lsp_info },
		lualine_z = { "location" },
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
