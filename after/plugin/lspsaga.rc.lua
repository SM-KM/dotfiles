local status, saga = pcall(require, 'lspsaga')
if (not status) then return end

saga.setup({}) 

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<cr>', opts)
