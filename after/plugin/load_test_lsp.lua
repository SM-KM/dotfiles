-- local client = vim.lsp.start {
--   name = "lsp_learn",
--   cmd = { "/home/smkm/personal/lsp/main" },
-- }

-- if not client then
--   vim.notify "hey, you didnt do the client think good"
--   return
-- end

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "markdown",
--   callback = function()
--     vim.lsp.buf_attach_client(0, client)
--   end
-- })
