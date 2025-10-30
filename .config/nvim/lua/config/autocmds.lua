-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_user_command("Finder", function()
  local file = vim.fn.expand("%p")
  if file == "" then
    vim.notify("No file in current buffer", vim.log.levels.WARN)
    return
  end
  vim.fn.system("open -R " .. vim.fn.shellescape(file))
end, { desc = "Open current file in Finder" })

vim.api.nvim_create_user_command("Sublime", function()
  local file = vim.fn.expand("%p")
  if file == "" then
    vim.notify("No file in current buffer", vim.log.levels.WARN)
    return
  end
  vim.fn.system("subl " .. vim.fn.shellescape(file))
end, { desc = "Open current file in Sublime Text" })
