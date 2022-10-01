local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
  vim.notify('Failed loading ' .. req_file, vim.log.levels.ERROR)
    return
end

impatient.enable_profile()
