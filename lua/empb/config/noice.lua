local status_ok, noice = pcall(require, "noice")
if not status_ok then
    vim.notify("Failed loading " .. req_file, vim.log.levels.INFO)
    return
end

noice.setup({
    cmdline = {
        enabled = true, -- enables the Noice cmdline UI
        view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
        view_search = "cmdline_popup_search", -- view for rendering the cmdline for search
        opts = { buf_options = { filetype = "vim" } }, -- enable syntax highlighting in the cmdline
        icons = {
            ["/"] = { icon = " ", hl_group = "NoiceCmdlineIconSearch" },
            ["?"] = { icon = " ", hl_group = "NoiceCmdlineIconSearch" },
            [":"] = { icon = " ", hl_group = "NoiceCmdlineIcon", firstc = false },
        },
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
            relative = "editor",
            align = "message-right",
            timeout = 3000,
            reverse = true,
            position = {
                row = -1,
                col = "70%",
                -- col = 0,
            },
            size = "auto",
            border = {
                style = "none",
            },
            zindex = 60,
            win_options = {
                winblend = 30,
                winhighlight = {
                    Normal = "NoiceMini",
                    IncSearch = "",
                    Search = "",
                },
            },
        },
    },

    routes = {
        {
            filter = { event = "msg_show", kind = "confirm_sub" },
            view = "mini",
        },
        {
            filter = { event = "msg_show", kind = "emsg" },
            view = "mini",
        },
        {
            filter = { event = "msg_show", kind = "echo" },
            view = "mini",
        },
        {
            filter = { event = "msg_show", kind = "echomsg" },
            view = "mini",
        },
        {
            filter = { event = "msg_show", kind = "echoerr" },
            view = "mini",
        },
        {
            filter = { event = "msg_show", kind = "lua_error" },
            view = "mini",
        },
        {
            filter = { event = "msg_show", kind = "rpc_error" },
            view = "mini",
        },
        {
            filter = { event = "msg_show", kind = "return_prompt" },
            view = "mini",
        },
        {
            filter = { event = "msg_show", kind = "quickfix" },
            view = "mini",
        },
        -- {
        --     filter = { event = "msg_show", kind = "search_count" },
        --     view = "mini",
        -- },
        {
            filter = { event = "msg_show", kind = "wmsg" },
            view = "mini",
        },
        {
            filter = { event = "msg_show", kind = "" },
            view = "mini",
        },
    },
})
