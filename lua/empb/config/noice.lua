local status_ok, noice = pcall(require, "noice")
if not status_ok then
    vim.notify("Failed loading " .. req_file, vim.log.levels.INFO)
    return
end

noice.setup({
    cmdline = {
        enabled = true, -- enables the Noice cmdline UI
        view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
        opts = { buf_options = { filetype = "vim" } }, -- enable syntax highlighting in the cmdline
    },
    messages = {
        -- NOTE: If you enable messages, then the cmdline is enabled automatically.
        -- This is a current Neovim limitation.
        enabled = true, -- enables the Noice messages UI
        view = "mini", -- default view for messages
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
                row = 5,
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
                row = -2,
                col = "100%",
                -- col = 0,
            },
            size = {
                min_width = 60,
                width = "auto",
                height = "auto",
            },
            border = {
                style = "single",
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
    },

    -- routes = {
    --     {
    --         filter = { event = "msg_show", kind = "confirm_sub" },
    --         view = "mini",
    --     },
    --     {
    --         filter = { event = "msg_show", kind = "emsg" },
    --         view = "mini",
    --     },
    --     {
    --         filter = { event = "msg_show", kind = "echo" },
    --         view = "mini",
    --     },
    --     {
    --         filter = { event = "msg_show", kind = "echomsg" },
    --         view = "mini",
    --     },
    --     {
    --         filter = { event = "msg_show", kind = "echoerr" },
    --         view = "mini",
    --     },
    --     {
    --         filter = { event = "msg_show", kind = "lua_error" },
    --         view = "mini",
    --     },
    --     {
    --         filter = { event = "msg_show", kind = "rpc_error" },
    --         view = "mini",
    --     },
    --     {
    --         filter = { event = "msg_show", kind = "return_prompt" },
    --         view = "mini",
    --     },
    --     {
    --         filter = { event = "msg_show", kind = "quickfix" },
    --         view = "mini",
    --     },
    --     -- {
    --     --     filter = { event = "msg_show", kind = "search_count" },
    --     --     view = "mini",
    --     -- },
    --     {
    --         filter = { event = "msg_show", kind = "wmsg" },
    --         view = "mini",
    --     },
    --     {
    --         filter = { event = "msg_show", kind = "" },
    --         view = "mini",
    --     },
    --     {
    --         filter = { event = "msg_show", kind = "", find = "leader" },
    --         opts = { skip = true },
    --     },
    -- },
})
