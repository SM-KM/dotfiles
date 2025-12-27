---@diagnostic disable: need-check-nil
local map = vim.keymap.set

map("n", "<space><space>x", "<cmd>source %<CR>")
map("n", "<space>x", ":.lua<CR>")
map("v", "<space>x", ":lua<CR>")
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("n", "<leader>ar", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- oil
-- map("n", "-", "<cmd>Oil<CR>")

-- windows

map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
map("n", "ss", ":split<Return><C-w>w")
map("n", "sv", ":vsplit<Return><C-w>w")
map("n", "cs", ":resize -2<CR>", { desc = "resize", silent = true })
map("n", "cw", ":resize +5<CR>", { desc = "resize", silent = true })
map("n", "cd", ":vertical resize -5<CR>", { desc = "resize right to left", silent = true })
map("n", "ca", ":vertical resize +5<CR>", { desc = "resize left to right", silent = true })

-- term

map("t", "<esc><esc>", "<c-\\><c-n>")

local job_id = 0
map("n", "<space>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 20)

  job_id = vim.bo.channel
end)

-- map("n", "<space>example", function()
--   vim.fn.chansend(job_id, { "echo 'hi'\r\n" })
-- end)

-- Testing
vim.keymap.set("n", "<leader>tf", ":PlenaryBustedFile %<CR>")

-- Tabs
map("n", "cn", ":cnext<CR>")
map("n", "cp", ":cprev<CR>")
map("n", "<Tab>", ":tabnext<CR>", { noremap = true })
map("n", "<S-Tab>", ":tabprevious<CR>", { noremap = true })

map("n", "<leader>tn", ":tabnew<CR>", { noremap = true })
map("n", "<leader>tc", ":tabclose<CR>", { noremap = true })

-- Leet
map("n", "<leader>c", ":Leet console<CR>", { noremap = true })
map("n", "<leader>s", ":Leet submit<CR>", { noremap = true })
map("n", "<leader>r", ":Leet run<CR>", { noremap = true })
map("n", "<leader>t", ":Leet list<CR>", { noremap = true })

-- diagnostics
map('n', '<M-d>', function()
  local diagnostics = vim.diagnostic.get(0)
  local converted = vim.diagnostic.toqflist(diagnostics)
  vim.fn.setqflist(converted)
end)

map('n', '<M-j>', ":cnext<CR>")
map('n', '<M-k>', ":cprev<CR>")
map('n', '<M-c>', ":cclose<CR>")
map('n', '<M-m>', ":copen<CR>")
