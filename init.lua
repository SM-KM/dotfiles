require("config.lazy")
require("config.mappings")
require("config.opts")

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('highlight yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

vim.cmd [[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NonText guibg=NONE ctermbg=NONE
  highlight NormalNC guibg=NONE ctermbg=NONE
  highlight EndOfBuffer guibg=NONE ctermbg=NONE
]]

vim.cmd [[
  highlight TelescopeNormal guibg=NONE ctermbg=NONE
  highlight TelescopeBorder guibg=NONE ctermbg=NONE
  highlight TelescopePromptNormal guibg=NONE ctermbg=NONE
  highlight TelescopePromptBorder guibg=NONE ctermbg=NONE
  highlight TelescopePromptTitle guibg=NONE ctermbg=NONE
  highlight TelescopePreviewTitle guibg=NONE ctermbg=NONE
  highlight TelescopeResultsTitle guibg=NONE ctermbg=NONE
]]

vim.api.nvim_set_hl(0, "QuickFixLine", { bg = "NONE", ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
