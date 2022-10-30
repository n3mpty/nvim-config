local status_ok, winbar = pcall(require, "barbecue")
if not status_ok then
    vim.notify("Failed loading " .. req_file, vim.log.levels.ERROR)
    return
end

winbar.setup({
    ---whether to create winbar updater autocmd
    ---@type boolean
    create_autocmd = true,

    ---buftypes to enable winbar in
    ---@type table<string>
    include_buftypes = { "" },

    ---filetypes not to enable winbar in
    ---@type table<string>
    exclude_filetypes = { "toggleterm", "noice" },

    ---returns a string to be shown at the end of winbar
    ---@type function(bufnr: number): string
    custom_section = function()
        return ""
    end,

    ---:help filename-modifiers
    ---@type table<string, string>
    modifiers = {
        dirname = ":~:.",
        basename = "",
    },

    ---icons used by barbecue
    ---@type table<string, string>
    symbols = {
        prefix = " ",
        separator = "",
        modified = "",
        default_context = "…",
    },

    ---icons for different context entry kinds
    ---@type table<string, string>
    kinds = {
        File = "",
        Package = "",
        Module = "",
        Namespace = "",
        Macro = "",
        Class = "",
        Constructor = "",
        Field = "",
        Property = "",
        Method = "",
        Struct = "",
        Event = "",
        Interface = "",
        Enum = "",
        EnumMember = "",
        Constant = "",
        Function = "",
        TypeParameter = "",
        Variable = "",
        Operator = "",
        Null = "",
        Boolean = "",
        Number = "",
        String = "",
        Key = "",
        Array = "",
        Object = "",
    },
})--[[ end ]]
