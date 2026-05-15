return {
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
    keys = {
      -- Opens todo-comments results in Trouble (`:TodoTrouble` → `:Trouble todo`; same filters as `:TodoTelescope keywords=…`).
      {
        '<leader>to',
        '<cmd>TodoTrouble<cr>',
        desc = '[T]rouble TODO comments',
      },
      -- Snacks picker; inherits `<C-t>` → Trouble from `Snacks.picker` configuration.
      {
        '<leader>st',
        function() Snacks.picker.todo_comments() end,
        desc = '[S]earch [T]ODO comments',
      },
      {
        ']t',
        function()
          require('todo-comments').jump_next()
        end,
        desc = 'Next todo comment',
      },
      {
        '[t',
        function()
          require('todo-comments').jump_prev()
        end,
        desc = 'Previous todo comment',
      },
    },
  },
}
