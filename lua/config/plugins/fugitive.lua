return {
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>g", ":Git<CR>")
      vim.keymap.set("n", "<leader>gc", function()
        local msg = vim.fn.input("Commit message: ")
        if msg ~= "" then
          vim.cmd("Git commit -m " .. vim.fn.shellescape(msg))
        else
          print("Commit aborted")
        end
      end)
    end
  }
}
