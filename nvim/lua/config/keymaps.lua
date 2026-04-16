-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>ss", "z=", { remap = true, desc = "Spelling Suggestions" })
vim.keymap.set("n", "<leader>sn", "]s", { remap = true, desc = "Next Misspelling" })
vim.keymap.set("n", "<leader>sp", "[s", { remap = true, desc = "Prev Misspelling" })
