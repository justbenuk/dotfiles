local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').reset()
require('packer').init({
  compile_path = vim.fn.stdpath('data')..'/site/plugin/packer_compiled.lua',
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'solid' })
    end,
  },
})

local use = require('packer').use

use 'wbthomason/packer.nvim'
use 'tpope/vim-commentary' -- better comment support
use 'tpope/vim-surround' -- add, change and delete surrounding text
use 'tpope/vim-eunuch' -- usefull commands like :Rename and :sudowrite
use 'tpope/vim-unimpaired' -- pairs of handy bracket mapping
use 'tpope/vim-sleuth' -- indent auto detection
use 'tpope/vim-repeat' -- allow the repeating of cammands
use 'sheerun/vim-polyglot' -- add more languages
use 'farmergreg/vim-lastplace' -- jump to the last location when opening a file
use 'nelstrom/vim-visual-star-search' -- enable * search with visually selected text
use 'jessarcher/vim-heritage' -- automatically create parent dirs when saving
use {
  'whatyouhide/vim-textobj-xmlattr',
  requires = 'kana/vim-textobj-user'
} -- text objects for html attributes
use {
  'airblade/vim-rooter',
  setup = function()
    -- we only need to run this once when vim starts
    vim.g.rooter_manual_only = 1
  end,
  config = function()
    vim.cmd('Rooter')
  end,
}

use {
  'jessarcher/onedark.nvim',
  config = function()
    vim.cmd('colorscheme onedark')

    vim.api.nvim_set_hl(0, 'FloatBorder', {
      fg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
      bg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
    })

    -- Make the cursor line background invisible
    vim.api.nvim_set_hl(0, 'CursorLineBg', {
      fg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
      bg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
    })

    vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = '#30323E' })

    vim.api.nvim_set_hl(0, 'StatusLineNonText', {
      fg = vim.api.nvim_get_hl_by_name('NonText', true).foreground,
      bg = vim.api.nvim_get_hl_by_name('StatusLine', true).background,
    })

    vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = '#2F313C' })
  end,
}
use {
  'windwp/nvim-autopairs',
  config = function()
    require('nvim-autopairs').setup()
  end,
} -- simple autopairs
use {
  'karb94/neoscroll.nvim',
  config = function()
    require('neoscroll').setup()
  end,
}
use{
  'famiu/bufdelete.nvim',
  config = function()
    vim.keymap.set('n', '<Leader>q', ':Bdelete<CR>')
  end,
}

use {
  'AndrewRadev/splitjoin.vim',
  config = function()
    vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
    vim.g.splitjoin_trailing_comma = 1
    vim.g.splitjoin_php_method_chain_full = 1
  end,
}

use {
  'sickill/vim-pasta',
  config = function()
    vim.g.pasta_disabled_filetypes = {'fugitive'}
  end,
}

-- Fuzzy finder
use({
  'nvim-telescope/telescope.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'kyazdani42/nvim-web-devicons',
    'nvim-telescope/telescope-live-grep-args.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
  },
  config = function()
    require('benandrews/plugins/telescope')
  end,
})

use {
  'kyazdani42/nvim-tree.lua',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('benandrews/plugins/nvim-tree')
  end,
}

use {
  'nvim-lualine/lualine.nvim',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('benandrews/plugins/lualine')
  end,
} -- this is the lualine at the bottom

use {
  'akinsho/bufferline.nvim',
  requires = 'kyazdani42/nvim-web-devicons',
  after = 'onedark.nvim',
  config = function()
    require('benandrews/plugins/bufferline')
  end,
}

use{
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    require('ibl').setup()
  end,
}

use {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('benandrews/plugins/dashboard-nvim')
  end,
  requires = {'nvim-tree/nvim-web-devicons'}
}

-- Git integration.
use({
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup()
    vim.keymap.set('n', ']h', ':Gitsigns next_hunk<CR>')
    vim.keymap.set('n', '[h', ':Gitsigns prev_hunk<CR>')
    vim.keymap.set('n', 'gs', ':Gitsigns stage_hunk<CR>')
    vim.keymap.set('n', 'gS', ':Gitsigns undo_stage_hunk<CR>')
    vim.keymap.set('n', 'gp', ':Gitsigns preview_hunk<CR>')
    vim.keymap.set('n', 'gb', ':Gitsigns blame_line<CR>')
  end,
})

-- Git commands.
use({
  'tpope/vim-fugitive',
  requires = 'tpope/vim-rhubarb',
})

--- Floating terminal.
use({
  'voldikss/vim-floaterm',
  config = function()
    vim.g.floaterm_width = 0.8
    vim.g.floaterm_height = 0.8
    vim.keymap.set('n', '<F1>', ':FloatermToggle<CR>')
    vim.keymap.set('t', '<F1>', '<C-\\><C-n>:FloatermToggle<CR>')
    vim.cmd([[
      highlight link Floaterm CursorLine
      highlight link FloatermBorder CursorLineBg
    ]])
  end
})

-- Improved syntax highlighting
use({
  'nvim-treesitter/nvim-treesitter',
  run = function()
    require('nvim-treesitter.install').update({ with_sync = true })
  end,
  requires = {
    --'JoosepAlviste/nvim-ts-context-commentstring',
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
    require('benandrews/plugins/treesitter')
  end,
})

-- Language Server Protocol.
use({
  'neovim/nvim-lspconfig',
  requires = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'b0o/schemastore.nvim',
    'jose-elias-alvarez/null-ls.nvim',
    'jayp0521/mason-null-ls.nvim',
  },
  config = function()
    require('benandrews/plugins/lspconfig')
  end,
})

-- Completion
use({
  'hrsh7th/nvim-cmp',
  requires = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'onsails/lspkind-nvim',
  },
  config = function()
    require('benandrews/plugins/cmp')
  end,
})

-- PHP Refactoring Tools
use({
  'phpactor/phpactor',
  ft = 'php',
  run = 'composer install --no-dev --optimize-autoloader',
  config = function()
    vim.keymap.set('n', '<Leader>pm', ':PhpactorContextMenu<CR>')
    vim.keymap.set('n', '<Leader>pn', ':PhpactorClassNew<CR>')
  end,
})

-- Project Configuration.
use({
  'tpope/vim-projectionist',
  requires = 'tpope/vim-dispatch',
  config = function()
    require('benandrews/plugins/projectionist')
  end,
})


-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if packer_bootstrap then
    require('packer').sync()
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
  augroup end
]])
