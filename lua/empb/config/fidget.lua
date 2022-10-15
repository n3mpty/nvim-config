local status_ok, fidget = pcall(require, "fidget")
if not status_ok then
      vim.notify('Failed loading ' .. req_file, vim.log.levels.ERROR)
    return
end

fidget.setup({
  align = {
    bottom = false,
  }
}
)
