local status_ok, comment = pcall(require, "Comment")
if not status_ok then
    vim.notify("Failed loading " .. req_file, vim.log.levels.ERROR)
    return
end

comment.setup({
    pre_hook = function(ctx)
        local U = require("Comment.utils")

        local location = nil
        if ctx.ctype == U.ctype.block then
            location = require("ts_context_commentstring.utils").get_cursor_location()
        elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
            location = require("ts_context_commentstring.utils").get_visual_start_location()
        end

        return require("ts_context_commentstring.internal").calculate_commentstring({
            key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
            location = location,
        })
    end,
})


vim.keymap.set("n", "<space>/", "<cmd>lua require('Comment.api').toggle.linewise.current('line')<cr>", { noremap = true, silent = true } )
vim.keymap.set("v", "<space>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>", { noremap = true, silent = true })
vim.keymap.set("x", "<space>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', { noremap = true, silent = true })
