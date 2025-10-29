local notes_dir = "~/notes"

return {
  {
    "gsuuon/note.nvim",
    opts = {
      spaces = {
        '~'
      }
    },

    config = function()
      vim.keymap.set("n", "<leader>fn", function()
        require("telescope.builtin").live_grep({
          cwd = vim.fn.expand(notes_dir),
          prompt_title = "Search Notes"
        })
      end)
    end
  }
}
