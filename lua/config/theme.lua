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

highlight TroubleNormal guibg=NONE ctermbg=NONE
highlight TroubleNormalNC guibg=NONE ctermbg=NONE
]]

vim.cmd [[
highlight! link TroubleNormal Normal     " link to Normal
highlight! link TroubleNormalNC Normal   " non-current window
highlight! link TroubleText Normal       " text
highlight! link TroubleSource Comment    " source part
highlight! link TroubleIndentLineNr LineNr
]]

-- Make statusline transparent
local hl = vim.api.nvim_set_hl

-- Default statusline highlight group
hl(0, "StatusLine", { bg = "NONE", fg = "#888888" })
hl(0, "StatusLineNC", { bg = "NONE", fg = "#555555" }) -- non-active windows

-- Optional: also make tabline transparent if you're using it
hl(0, "TabLine", { bg = "NONE", fg = "#666666" })
hl(0, "TabLineSel", { bg = "NONE", fg = "#00ff66", bold = true })
hl(0, "TabLineFill", { bg = "NONE" })
