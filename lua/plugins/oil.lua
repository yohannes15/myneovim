return {
  {
    'stevearc/oil.nvim',
    lazy = false,
    opts = {
      -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
      default_file_explorer = true,
      -- Idempotent columns
      columns = {
        'icon',
      },
      -- Window-local options
      win_options = {
        conceallevel = 3,
        concealcursor = 'nvic',
      },
      -- Keymaps in oil buffer
      keymaps = {
        ['<C-v>'] = { 'actions.select', opts = { vertical = true }, desc = 'Open the selection in a vertical split' },
        ['<C-x>'] = { 'actions.select', opts = { horizontal = true }, desc = 'Open the selection in a horizontal split' },
      },
      -- Set to false to disable all of the above keymaps
      use_default_keymaps = true,
      view_options = {
        show_hidden = false,
        is_always_hidden = function(name)
          return name == '..'
        end,
      },
      -- Configuration for the floating window in :Oil --float
      float = {
        -- Padding around the floating window
        padding = 2,
        max_width = 80,
        max_height = 20,
        border = 'rounded',
        win_options = {
          winblend = 0,
        },
      },
    },
    -- Optional dependencies
    dependencies = { { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font } },
    keys = {
      { '-', '<CMD>Oil --float<CR>', desc = 'Open parent directory in float' },
    },
  },
}
