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
