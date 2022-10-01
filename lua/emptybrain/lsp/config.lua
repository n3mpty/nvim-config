local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local status_ok_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig" )
if not status_ok_lspconfig then
    return
end

local servers = {
	"gopls",
	"cssls",
	"clangd",
	"dockerls",
	"eslint",
	"html",
	"jsonls",
	"marksman", 
	"sumneko_lua",
	"rust_analyzer",
	-- 'pyright',
	"jedi_language_server",
	"yamlls",
	"bashls",
	"taplo",
	"tsserver",
	"elixirls",
}


mason.setup({
    ui = {
        border = "single",
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 5
})

mason_lspconfig.setup({
	ensure_installed = servers,
    automatic_instalallation = true
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = require("emptybrain.lsp.handlers").on_attach,
		capabilities = require("emptybrain.lsp.handlers").capabilities,
	})

	if lsp == "rust_analyzer" then
		local rust_opts = require("emptybrain.configs.rust-tools")
		local rust_tools_status_ok, rust_tools = pcall(require, "rust-tools")
		if not rust_tools_status_ok then
			return
		end
	end
end

require("lspconfig").pyright.setup({
	settings = {
		python = {
			analysis = {
				autoSearchPaths = false,
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
				autoImportCompletions = false,
				logLevel = "Information",
			},
		},
		pyright = {
			typeCheckingMode = "basic",
			disableLanguageServices = true,
			disableOrganizeImports = true,
		},
	},
})

require("lspconfig").elixirls.setup({
	cmd = { "/home/emptyuser/.elixir-ls/language_server.sh" },
})

require("lspconfig").gopls.setup({})

--[[ local pylsp_opts = { ]]
--[[ 	settings = { ]]
--[[ 		pylsp = { ]]
--[[ 			plugins = { ]]
--[[ 				pylsp_mypy = { enabled = true, live_mode = true }, ]]
--[[ 				pyflakes = { enabled = false }, ]]
--[[ 				jedi_symbols = { enabled = false }, ]]
--[[ 				jedi_completion = { enabled = false, eager = false }, ]]
--[[ 				jedi_hover = { enabled = false }, ]]
--[[ 				pycodestyle = { enabled = false }, ]]
--[[ 				-- black = { enabled = true, line_length = 100 }, ]]
--[[ 			}, ]]
--[[ 		}, ]]
--[[ 	}, ]]
--[[ } ]]
--[[ require("lspconfig")["pylsp"].setup(pylsp_opts) ]]
