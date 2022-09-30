local status_ok, tabby = pcall(require, "tabby")
if not status_ok then
  vim.notify('Failed loading ' .. req_file, vim.log.levels.ERROR)
    return
end

tabby.setup()
