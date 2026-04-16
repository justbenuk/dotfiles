-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local web_spell = vim.api.nvim_create_augroup("web_spell", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = web_spell,
  pattern = { "gitcommit", "markdown", "text", "plaintex", "tex" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.wrap = true
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = web_spell,
  pattern = { "*.mdx" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.wrap = true
  end,
})
