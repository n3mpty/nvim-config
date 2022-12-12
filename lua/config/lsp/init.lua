local status_ok, lsp = pcall(require, "lsp-zero")
if not status_ok then
    return
end



lsp.ensure_installed({
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
    -- "pyright",
    "jedi_language_server",
    "yamlls",
    "bashls",
    "taplo",
    "tsserver",
    "elixirls",
})
lsp.preset("recommended")

lsp.on_attach(function(client, bufnr)
    vim.b.lsp_attached = true
    local opts = { noremap = true, silent = true }
    local map = vim.api.nvim_buf_set_keymap
    map(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
    map(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    map(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    map(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    map(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    map(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float({border = 'single'})<CR>", opts)
    map(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format({async=true})<cr>", opts)
    map(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
    map(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
    map(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
    map(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    map(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    map(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)



    vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
            local opts = {
                focusable = false,
                close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                border = "single",
                source = "always",
                prefix = " ",
                scope = "cursor",
            }
            vim.diagnostic.open_float(nil, opts)
        end,
    })

    
end)




lsp.set_preferences({
    suggest_lsp_servers = true,
    setup_servers_on_start = true,
    set_lsp_keymaps = true,
    configure_diagnostics = true,
    cmp_capabilities = true,
    manage_nvim_cmp = false,
    call_servers = 'local',
    sign_icons = {
        error = '',
        warn = '▲',
        hint = '',
        info = '',
    }
})




--[[ rust_tools = require("config.plugins.rust-tools") ]]
require("rust-tools").setup({
    server = lsp.build_options("rust_analyzer", {})
})

lsp.use("pyright", {
    settings = {
        python = {
            analysis = {
                autoSearchPaths = false,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
                autoImportCompletions = false,
                logLevel = "Information",
            }
        },
        pyright = {
            typeCheckingMode = "basic",
            disableLanguageServices = true,
            disableOrganizeImports = true,
        }
    }
})


lsp.setup()

local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    return
end


local null_opts = lsp.build_options("null-ls", {})

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local hover = null_ls.builtins.hover

null_ls.setup({
    on_attach = null_opts.on_attach,
    sources = {
        null_ls.builtins.formatting.black.with({ extra_args = { "--fast", "--line-lenght=200" } }),
        -- diagnostics.pylint.with( { filetypes = { "python" }}),
        formatting.stylua,
        formatting.rustfmt,
    },
})



