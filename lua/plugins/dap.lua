return {
  {
    'mfussenegger/nvim-dap',
    keys = {
      {
        '<F5>',
        function() require('dap').continue() end,
        desc = 'Debug: Start/Continue',
      },
      {
        '<F6>',
        function() require('dap').pause() end,
        desc = 'Debug: Pause',
      },
      {
        '<F7>',
        function() require('dap').step_into() end,
        desc = 'Debug: Step Into',
      },
      {
        '<F8>',
        function() require('dap').step_over() end,
        desc = 'Debug: Step Over',
      },
      {
        '<leader>db',
        function() require('dap').toggle_breakpoint() end,
        desc = 'Debug: Toggle Breakpoint',
      },
      {
        '<leader>dB',
        function() require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ') end,
        desc = 'Debug: Conditional Breakpoint',
      },
      {
        '<leader>dr',
        function() require('dap').repl.toggle() end,
        desc = 'Debug: Toggle REPL',
      },
      {
        '<leader>du',
        function() require('dapui').toggle() end,
        desc = 'Debug: Toggle UI',
      },
      {
        '<leader>dl',
        function() require('dap').run_last() end,
        desc = 'Debug: Run Last',
      },
    },
    dependencies = {
      {
        'rcarriga/nvim-dap-ui',
        dependencies = {
          'nvim-neotest/nvim-nio',
        },
        opts = {},
      },
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end

      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end

      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
      end

    end,
  },
}
