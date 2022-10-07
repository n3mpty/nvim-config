-- Setup nvim-cmp.
local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
      vim.notify('Failed loading ' .. req_file, vim.log.levels.ERROR)
    return
end

local Rule = require("nvim-autopairs.rule")

npairs.setup({
	disable_filetype = { "TelescopePrompt" },
	enable_bracket_in_quote = false,
	enable_moveright = false,
	check_ts = true, -- treesitter integration
	map_cr = true,
})


--[[ local cmp_autopairs = require("nvim-autopairs.completion.cmp") ]]
--[[ local cmp_status_ok, cmp = pcall(require, "cmp") ]]
--[[ if not cmp_status_ok then ]]
--[[ 	return ]]
--[[ end ]]
--[[ cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done {}) ]]

-- https://github.com/rstacruz/vim-closer/blob/master/autoload/closer.vim
local get_closing_for_line = function(line)
	local i = -1
	local clo = ""

	while true do
		i, _ = string.find(line, "[%(%)%{%}%[%]]", i + 1)
		if i == nil then
			break
		end
		local ch = string.sub(line, i, i)
		local st = string.sub(clo, 1, 1)

		if ch == "{" then
			clo = "}" .. clo
		elseif ch == "}" then
			if st ~= "}" then
				return ""
			end
			clo = string.sub(clo, 2)
		elseif ch == "(" then
			clo = ")" .. clo
		elseif ch == ")" then
			if st ~= ")" then
				return ""
			end
			clo = string.sub(clo, 2)
		elseif ch == "[" then
			clo = "]" .. clo
		elseif ch == "]" then
			if st ~= "]" then
				return ""
			end
			clo = string.sub(clo, 2)
		end
	end

	return clo
end

npairs.remove_rule("(")
npairs.remove_rule("{")
npairs.remove_rule("[")

npairs.add_rule(Rule("[%(%{%[]", "")
	:use_regex(true)
	:replace_endpair(function(opts)
		return get_closing_for_line(opts.line)
	end)
	:end_wise())
