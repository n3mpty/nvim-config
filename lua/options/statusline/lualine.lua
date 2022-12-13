local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local colors = {
    blue = "#349bb3",
    cyan = "#34b392",
    black = "#000000",
    white = "#ebebeb",
    red = "#b33434",
    violet = "#b334b0",
    grey = "#272727",
    green = "#34b346",
    purple = "#6a34b3",
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

        return " " .. table.concat(buf_client_names, ", ") .. ""

        -- return "LSP ON"
    end,
    cond = hide_in_width,
    icon = "",
    color = { gui = "bold", bg = colors.grey },
}

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn" },
    symbols = { error = " ", warn = " " },
    colored = true,
    update_in_insert = false,
    always_visible = true,
    separator = { left = "", right = "" },
    color = { bg = colors.black },
}

local diff = {
    "diff",
    colored = true,
    --[[ symbols = { added = "+ ", modified = "~! ", removed = "✘" }, -- changes diff symbols ]]
    --[[ color = { bg = colors.grey }, ]]
    separator = { left = "", right = "" },
}

local filetype = {
    "filetype",
    icons_enabled = true,
    icon_only = true,
    icon = nil,
    colored = true,
    color = { bg = colors.black },
    -- color = { fg = colors.white, bg = colors.black },
}

local filename = {
    "filename",
    path = 1,
    icons_enabled = true,
    color = { bg = colors.black, fg = colors.white },
    separator = { left = "", right = "" },
    symbols = {
        modified = "●",
        readonly = "",
    },
}

local branch = {
    "branch",
    icons_enabled = true,
    icon = "",
    color = { bg = colors.black },
}

local mode = {
    "mode",
    --[[ separator = { left = '', right = '' }, ]]
}

local location = {
    "location",
    --[[ separator = { left = "", right = "" }, ]]
}

local python_env = {
    function()
        local utils = require("config.statusline.utils")
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

local navic = require("nvim-navic")

local winbar = {
    lualine_a = {
        {
            "filename",
            icons_enabled = true,
            color = { bg = colors.transparent, fg = colors.blue },
            path = 1,
            separator = { left = "", right = "" },
        },
    },
    lualine_c = {
        {
            navic.get_location,
            cond = navic.is_available,
            color = { bg = colors.transparent, fg = colors.blue },
            separator = { left = "", right = "" },
        },
    },
    --[[ lualine_z = {  diagnostics }, ]]
}

local theme = {
    normal = {
        a = { fg = colors.black, bg = colors.red },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.white, bg = colors.black },
        x = { fg = colors.white, bg = colors.black },
        y = { fg = colors.white, bg = colors.black },
        z = { fg = colors.black, bg = colors.red },
    },
    insert = {
        a = { fg = colors.black, bg = colors.green },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.white, bg = colors.black },
        x = { fg = colors.white, bg = colors.black },
        y = { fg = colors.white, bg = colors.black },
        z = { fg = colors.white, bg = colors.black },
    },
    visual = {
        a = { fg = colors.black, bg = colors.purple },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.white, bg = colors.black },
        x = { fg = colors.white, bg = colors.black },
        y = { fg = colors.white, bg = colors.black },
        z = { fg = colors.white, bg = colors.black },
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
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.white, bg = colors.black },
        x = { fg = colors.white, bg = colors.black },
        y = { fg = colors.white, bg = colors.black },
        z = { fg = colors.white, bg = colors.black },
    },
}

lualine.setup({
    options = {
        icons_enabled = true,
        theme = theme,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
            statusline = { "NvimTree", "neo-tree", "Outline", "Packer", "AlphaReady", "DiffviewFilePanel" },
            --[[ winbar = { "NvimTree", "neo-tree", "Outline", "Packer", "Trouble", "AlphaReady", "DiffviewFilePanel" }, ]]
        },
        ignore_focus = {
            "NvimTree",
            "Outline",
            "Packer",
            "Trouble",
            "Alpha",
        },
        always_divide_middle = true,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            --[[ winbar = 1000, ]]
        },
    },
    sections = {
        lualine_a = { mode },
        lualine_b = { branch, diff, "filename" },
        lualine_c = { diagnostics },
        lualine_x = {},
        lualine_y = { lsp_info },
        lualine_z = { location },
    },
    inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { diagnostics },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {
        -- lualine_a = { { "buffers", mode = 2 } },
        -- lualine_z = { "tabs" },
    },
    winbar = {},
    --[[ inactive_winbar = { ]]
    --[[     lualine_a = { "filename" }, ]]
    --[[     lualine_b = {  }, ]]
    --[[     lualine_c = {}, ]]
    --[[     lualine_x = {}, ]]
    --[[     lualine_y = {}, ]]
    --[[     lualine_z = {  }, ]]
    --[[ }, ]]
    extensions = {},
})
