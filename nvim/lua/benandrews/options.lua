-- Set the tabs and sizes
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- set the indenting and turn of line wrapping
vim.opt.smartindent = true
vim.opt.wrap = false

-- set the number lines
vim.opt.number = true
vim.opt.relativenumber = true

-- configure autocomplete
vim.opt.wildmode = 'longest:full,full' -- complete the longest common match, and allow tabbing the results to fully complete them

-- set terminal things like title, colors etc
vim.opt.title = true
vim.opt.mouse = 'a' -- allows mouse for all modes
vim.opt.termguicolors = true
vim.opt.spell = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.list = true -- enable the below list chars
vim.opt.fillchars:append({eob = ' '}) -- remove the ~ from the end of the buffer
vim.opt.splitbelow = true
vim.opt.splitright = true

-- scroll settings
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- set the clipboard
vim.opt.clipboard = 'unnamedplus' -- Use the system clipboard

--handle some errors
vim.opt.confirm = true --ask for confirmation instead of erroring

vim.opt.undofile = true -- persistent mode

