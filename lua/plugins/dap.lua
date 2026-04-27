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
        ---@type dapui.Config
        opts = {
          layouts = {
            {
              elements = {
                { id = 'scopes', size = 0.25 },
                { id = 'breakpoints', size = 0.25 },
                { id = 'stacks', size = 0.25 },
                { id = 'watches', size = 0.25 },
              },
              size = 0.15,
              position = 'left',
            },
            {
              -- Bottom strip: default `size = 10` is only 10 lines (very tight).
              -- Use a fraction of editor height; split width so REPL gets most room.
              elements = {
                { id = 'repl', size = 0.65 },
                { id = 'console', size = 0.35 },
              },
              size = 0.25,
              position = 'bottom',
            },
          },
        },
      },
    },
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')

      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end

      -- Leave UI open when the session ends; close with `<leader>du` (or re-add
      -- before.event_terminated / before.event_exited → dapui.close() for auto-close).

      require('plugins.dap_scala').register(dap)
      -- e.g. later: require('plugins.dap_python').register(dap)
    end,
  },
}
