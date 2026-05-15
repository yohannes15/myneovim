-- Core globals need to be set before plugins load so lazy-loaded specs see the right values.

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Disable netrw for oil.nvim
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
