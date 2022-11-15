local status_ok, noice = pcall(require, "noice")
if not status_ok then
    vim.notify("Failed loading " .. req_file, vim.log.levels.INFO)
    return
end
local border = {
    { "🭽", "FloatBorder" },
    { "▔", "FloatBorder" },
    { "🭾", "FloatBorder" },
    { "▕", "FloatBorder" },
    { "🭿", "FloatBorder" },
    { "▁", "FloatBorder" },
    { "🭼", "FloatBorder" },
    { "▏", "FloatBorder" },
}
noice.setup({
    cmdline = {
        enabled = true, -- enables the Noice cmdline UI
        view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
        opts = { buf_options = { filetype = "vim" } }, -- enable syntax highlighting in the cmdline
    },
    popupmenu = {
        enabled = true, -- enables the Noice popupmenu UI
        ---@type 'nui'|'cmp'
        backend = "nui", -- backend to use to show regular cmdline completions
        ---@type NoicePopupmenuItemKind|false
        -- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
        kind_icons = {}, -- set to `false` to disable icons
    },
    hover = {
        enabled = true,
        view = nil, -- when nil, use defaults from documentation
        ---@type NoiceViewOptions
        opts = {}, -- merged with defaults from documentation
    },
    signature = {
        enabled = false,
        auto_open = {
            enabled = false,
            trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
            luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
            throttle = 50, -- Debounce lsp signature help request by 50ms
        },
        view = nil, -- when nil, use defaults from documentation
        ---@type NoiceViewOptions
        opts = {}, -- merged with defaults from documentation
    }, documentation = {
        view = "hover",
        ---@type NoiceViewOptions
        opts = {
            lang = "markdown",
            replace = true,
            render = "single",
            format = { "{message}" },
            win_options = { concealcursor = "n", conceallevel = 3 },
        },
    },
    messages = {
        -- NOTE: If you enable messages, then the cmdline is enabled automatically.
        -- This is a current Neovim limitation.
        enabled = true, -- enables the Noice messages UI
        view = "notify", -- default view for messages
        view_error = "notify", -- view for errors
        view_warn = "notify", -- view for warnings
        view_history = "split", -- view for :messages
        view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
    },
    lsp_progress = {
        enabled = true,
        -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
        -- See the section on formatting for more details on how to customize.
        --- @type NoiceFormat|string
        format = "lsp_progress",
        --- @type NoiceFormat|string
        format_done = "lsp_progress_done",
        throttle = 1000 / 30, -- frequency to update lsp progress message
        view = "mini",
    },

    views = {
        cmdline_popup = {
            backend = "popup",
            relative = "editor",
            focusable = false,
            enter = false,
            zindex = 60,
            position = {
                row = 2,
                col = "50%",
            },
            size = {
                min_width = 60,
                width = "auto",
                height = "auto",
            },
            border = {
                style = "single",
                padding = { 0, 1 },
                text = {
                    top = " CMD ",
                },
            },
        },
        mini = {
            backend = "mini",
            focusable = true,
            relative = "editor",
            align = "message-right",
            timeout = 3000,
            reverse = true,
            position = {
                row = -3,
                col = "100%",
                -- col = 0,
            },
            size = {
                min_width = 60,
                width = "auto",
                height = "auto",
            },
            border = {
                style = border,
            },
            zindex = 60,
            win_options = {
                winblend = 0,
                winhighlight = {
                    Normal = "NoiceMini",
                    IncSearch = "",
                    Search = "",
                },
            },
        },
        hover = {
            view = "popup",
            relative = "cursor",
            zindex = 60,
            enter = false,
            anchor = "auto",
            size = {
                width = "auto",
                height = "auto",
                max_height = 20,
                max_width = 120,
            },
            border = {
                style = border,
                padding = { 0, 2 },
            },
            position = { row = 2, col = 0 },
            win_options = {
                wrap = true,
                linebreak = true,
            },
        },
        presets = {
            -- you can enable a preset by setting it to true, or a table that will override the preset config
            -- you can also add custom presets that you can enable/disable with enabled=true
            bottom_search = false, -- use a classic bottom cmdline for search
            command_palette = false, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = true, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = false, -- add a border to hover docs and signature help
        },
    },
})
