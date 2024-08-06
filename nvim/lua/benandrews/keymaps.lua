-- set the space to leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- when text is wrapped, move by terminal rows, not lines, unless a count is provided
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true})
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true})

-- reselect visual selection after indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Maintain the cursor position when yanking a visual selection
vim.keymap.set('v', 'y', 'myy`y')

-- disable the command line typo
vim.keymap.set('n', 'q:', ':q')

-- paste replace visual selection without copying it
vim.keymap.set('v', 'p', '"_dP')

-- easy insert of trailing ; or , from insert mode
vim.keymap.set('i', ';;', '<Esc>A;')
vim.keymap.set('i', ',,', '<Esc>A,')

--quickly clear search highlights
vim.keymap.set('n', '<Leader>k', ':nohlsearch<CR>')

-- open the current file in the default program (if using a mac this should just be open)
vim.keymap.set('n', '<Leader>x', ':!xdg-open %<CR><CR>')

-- Move lines up and down.
vim.keymap.set('i', '<A-j>', '<Esc>:move .+1<CR>==gi')
vim.keymap.set('i', '<A-k>', '<Esc>:move .-2<CR>==gi')
vim.keymap.set('n', '<A-j>', ':move .+1<CR>==') 
vim.keymap.set('n', '<A-k>', ':move .-2<CR>==') 
vim.keymap.set('v', '<A-j>', ":move '>+1<CR>gv=gv") 
vim.keymap.set('v', '<A-k>', ":move '<-2<CR>gv=gv")

