return {
  {
    "sindrets/diffview.nvim",
    config = function()
      vim.keymap.set("n", "<leader>dfo", ":DiffviewOpen<CR>")
      vim.keymap.set("n", "<leader>dfc", ":DiffviewClose<CR>")
    end
  }
}
