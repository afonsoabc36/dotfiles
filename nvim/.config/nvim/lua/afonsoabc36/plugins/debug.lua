return {
  "mfussenegger/nvim-dap",

  dependencies = {
    -- Creates a beautiful debugger UI
    "rcarriga/nvim-dap-ui",
    -- Required dependency for nvim-dap-ui
    "nvim-neotest/nvim-nio",
    -- Installs the debug adapters for you
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
    -- Add your own debuggers here
    "leoluz/nvim-dap-go",
    "mfussenegger/nvim-dap-python",
    "theHamsta/nvim-dap-virtual-text",
    { "nicholasmata/nvim-dap-cs", dependencies = { "mfussenegger/nvim-dap" } },
  },

  keys = {
    {
      "<F5>",
      function()
        require("dap").continue()
      end,
      desc = "Debug: Start/Continue",
    },
    {
      "<F1>",
      function()
        require("dap").step_into()
      end,
      desc = "Debug: Step Into",
    },
    {
      "<F2>",
      function()
        require("dap").step_over()
      end,
      desc = "Debug: Step Over",
    },
    {
      "<F3>",
      function()
        require("dap").step_out()
      end,
      desc = "Debug: Step Out",
    },
    {
      "<leader>b",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Debug: Toggle Breakpoint",
    },
    {
      "<leader>dr",
      function()
        require("dap").repl.open()
      end,
      desc = "Debug: REPL open",
    },
    {
      "<leader>dl",
      function()
        require("dap").run_last()
      end,
      desc = "Debug: REPL open",
    },
    {
      "<leader>B",
      function()
        require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end,
      desc = "Debug: Set Breakpoint",
    },
    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    {
      "<F7>",
      function()
        require("dapui").toggle()
      end,
      desc = "Debug: See last session result.",
    },
  },

  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- Use locally installed netcoredbg if available, otherwise fall back to mason
    local local_path = "/Users/afonsosilva/git/netcoredbg/bin/netcoredbg"
    local mason_path = vim.fn.stdpath("data") .. "/mason/packages/netcoredbg/netcoredbg"
    local debugger_path = vim.fn.filereadable(local_path) == 1 and local_path or mason_path

    local netcoredbg_adapter = {
      type = "executable",
      command = debugger_path,
      args = { "--interpreter=vscode" },
    }

    dap.adapters.netcoredbg = netcoredbg_adapter -- needed for normal debugging
    dap.adapters.coreclr = netcoredbg_adapter -- needed for unit test debugging

    -- Enable debug logging
    dap.set_log_level("TRACE")
    local log_path = vim.fn.stdpath("cache") .. "/dap.log"
    vim.fn.writefile({ "DAP Log: " .. os.date() }, log_path)

    require("mason-nvim-dap").setup({
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_setup = true,
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        -- "delve",
        "debugpy",
      },
    })

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup(
      -- {
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      -- icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
      -- controls = {
      --   icons = {
      --     pause = "⏸",
      --     play = "▶",
      --     step_into = "⏎",
      --     step_over = "⏭",
      --     step_out = "⏮",
      --     step_back = "b",
      --     run_last = "▶▶",
      --     terminate = "⏹",
      --     disconnect = "⏏",
      --   },
      -- },
      -- }
    )

    -- Change breakpoint icons
    vim.api.nvim_set_hl(0, "DapBreak", { fg = "#e51400" })
    vim.api.nvim_set_hl(0, "DapStop", { fg = "#ffcc00" })
    local breakpoint_icons = vim.g.have_nerd_font
        and {
          Breakpoint = "",
          BreakpointCondition = "",
          BreakpointRejected = "",
          LogPoint = "",
          Stopped = "",
        }
      or {
        Breakpoint = "●",
        BreakpointCondition = "⊜",
        BreakpointRejected = "⊘",
        LogPoint = "◆",
        Stopped = "⭔",
      }
    for type, icon in pairs(breakpoint_icons) do
      local tp = "Dap" .. type
      local hl = (type == "Stopped") and "DapStop" or "DapBreak"
      vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
    end

    dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close

    -- Install golang specific config
    -- require('dap-go').setup()
    require("dap-python").setup()
    -- Configure C# test debugging
    dap.configurations.cs = {
      {
        type = "coreclr",
        name = "LAUNCH directly from nvim",
        request = "launch",
        program = function()
          return require("dap-dll-autopicker").build_dll_path()
        end,
      },
      -- {
      --   type = "coreclr",
      --   name = "ATTACH to running app in dedicated terminal",
      --   request = "attach",
      --   processId = function()
      --     return require("dap.utils").pick_process()
      --   end,
      -- }
    }
  end,
}
