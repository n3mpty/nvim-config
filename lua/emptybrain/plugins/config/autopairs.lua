-- Setup nvim-cmp.
local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end
npairs.setup {
  disable_filetype = { "TelescopePrompt" },
  enable_moveright = false,
  check_ts = true, -- treesitter integration
}

local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done {})

npairs.remove_rule('(')
npairs.remove_rule('{')
npairs.remove_rule('[')




