return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",            -- sidebar UI (stack, scopes, breakpoints)
      "theHamsta/nvim-dap-virtual-text", -- inline variable values
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- UI setup
      dapui.setup()
      require("nvim-dap-virtual-text").setup()

      -- Open/close dap-ui automatically
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      dap.adapters.cpp = {
        type = "executable",
        command = "gdb",
        args = { "-i", "dap" }, -- run gdb in DAP mode
      }

      dap.configurations.cpp = {
        {
          name = "Launch C++ program",
          type = "cpp",
          request = "launch",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
          setupCommands = {
            {
              text = "-enable-pretty-printing",
              description = "enable pretty printing for gdb",
              ignoreFailures = false,
            },
          },
        },
      }

      -- Reuse config for C (since it’s almost the same)
      dap.configurations.c = dap.configurations.cpp

      -- Keymaps
      local map = vim.keymap.set
      map("n", "<leader>ds", dap.continue, { desc = "DAP Continue/Start" })
      map("n", "<F10>", dap.step_over, { desc = "DAP Step Over" })
      map("n", "<F11>", dap.step_into, { desc = "DAP Step Into" })
      map("n", "<leader>do", dap.step_out, { desc = "DAP Step Out" })
      map("n", "<Leader>b", dap.toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })
      map("n", "<Leader>B", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, { desc = "DAP Conditional Breakpoint" })
      map("n", "<Leader>dr", dap.repl.open, { desc = "DAP REPL" })
      map("n", "<Leader>dl", dap.run_last, { desc = "DAP Run Last" })
      map("n", "<Leader>du", dapui.toggle, { desc = "DAP UI Toggle" })

      vim.keymap.set("n", "<Leader>dw", function()
        local var = vim.fn.expand("<cword>")
        require("dapui").elements.watches.add(var)
      end, { desc = "DAP Add Watch for variable under cursor" })
    end,
  },
}
