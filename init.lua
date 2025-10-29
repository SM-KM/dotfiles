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

local function is_current_buffer_empty()
  local bufnr = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

  -- A buffer is considered empty if it has no lines, or if it has
  -- one line that is completely empty


  if #lines == 0 then
    return true
  elseif #lines == 1 and #lines[1] == 0 then
    return true
  end

  return false
end

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufWinEnter' }, {
  pattern = '*.h',
  callback = function()
    local filename = vim.fn.expand("%:t:r")
    local guard_name = string.upper(filename) .. "_H"
    local header_content = {
      "#ifndef " .. guard_name,
      "#define " .. guard_name,
      "",
      "",
      "#endif // " .. guard_name,
    }

    if is_current_buffer_empty() then
      vim.api.nvim_buf_set_lines(0, 0, -1, false, header_content)
    end
  end
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
