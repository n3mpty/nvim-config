local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end


local kind_icons = {
  Text = " [Text]",
  Method = " [Method]",
  Function = " [Function]",
  Constructor = " [Constructor]",
  Field = " [Field]",
  Variable = " [Variable]",
  Class = " [Class]",
  Interface = " [Interface]",
  Module = " [Module]",
  Property = " [Property]",
  Unit = " [Unit]",
  Value = " [Value]",
  Enum = " [Enum]",
  Keyword = " [Keyword]",
  Snippet = " [Snippet]",
  Color = " [Color]",
  File = " [File]",
  Reference = " [Reference]",
  Folder = " [Folder]",
  EnumMember = " [EnumMember]",
  Constant = " [Constant]",
  Struct = " [Struct]",
  Event = " [Event]",
  Operator = " [Operator]",
  TypeParameter = " [TypeParameter]",
}

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  formatting = {
    fields = { "menu", "abbr", "kind" },
    format = function(entry, vim_item)
      vim_item.kind = kind_icons[vim_item.kind]
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        nvim_lua = "[Nvim]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
        emoji = "",
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
    -- { name = "buffer-lines" },

  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  window = {
    completion = cmp.config.window.bordered({
      border = "single",
      winhighlight = "FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
    }),
    documentation = cmp.config.window.bordered({
      border = "single",
      winhighlight = "FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
    }),
  },
  experimental = {
    ghost_text = true,
  },
})


