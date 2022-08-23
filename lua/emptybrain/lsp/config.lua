local status_ok, lsp_installer = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

local lspconfig = require("lspconfig")

local servers = {
	"cssls",
	"dockerls",
	"eslint",
	"html",
	"jsonls",
	"marksman", -- Markdown
	"sumneko_lua",
	"rust_analyzer",
	-- 'pyright',
	"jedi_language_server",
	"yamlls",
	"bashls",
	"taplo", -- Toml
}

lsp_installer.setup({
	ensure_installed = servers,
})

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = require("emptybrain.lsp.handlers").on_attach,
		capabilities = require("emptybrain.lsp.handlers").capabilities,
	})

	if lsp == "rust_analyzer" then
		local rust_opts = require("emptybrain.plugins.config.rust-tools")
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
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
			},
		},
		pyright = {
			disableLanguageServices = true,
			disableOrganizeImports = true,
		},
	},
})

-- require("lspconfig").rust_analyzer.setup({
--     -- on_attach is a callback called when the language server attachs to the buffer
--     -- on_attach = on_attach,
--     settings = {
--       -- to enable rust-analyzer settings visit:
--       -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
--       ["rust-analyzer"] = {
--         -- enable clippy diagnostics on save
--         checkOnSave = {
--           command = "clippy"
--         },
--       }
--     }
-- })
-- local pylsp_opts = {
--   settings = {
--     pylsp = {
--       plugins = {
--         pylsp_mypy = { enabled = true, live_mode = true },
--         pyflakes = { enabled = false },
--         jedi_symbols = { enabled = false },
--         jedi_completion = { enabled = false, eager = false },
--         jedi_hover = { enabled = false },
--         pycodestyle = { enabled = false }
--         -- black = { enabled = true, line_length = 100 },
--       }
--     }
--   }
-- }
-- require("lspconfig")["pylsp"].setup(pylsp_opts)
