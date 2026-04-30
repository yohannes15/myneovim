-- File tree (Kickstart-style: `\` toggles / reveals current file)
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    lazy = false,
    keys = {
      { '\\', ':Neotree reveal<CR>', desc = 'Neo-tree reveal', silent = true },
    },
    ---@module 'neo-tree'
    ---@type neotree.Config
    opts = {
      window = {
        width = function()
          return math.max(18, math.min(34, math.floor(vim.o.columns * 0.24)))
        end,
        mappings = { ['<space>'] = 'none' },
      },
      filesystem = {
        window = { mappings = { ['\\'] = 'close_window' } },
      },
    },
    config = function(_, opts)
      require('neo-tree').setup(opts)
      vim.api.nvim_create_autocmd('VimResized', {
        group = vim.api.nvim_create_augroup('NeoTreeResize', { clear = true }),
        callback = function()
          local utils = require('neo-tree.utils')
          local manager = require('neo-tree.sources.manager')
          local visible = require('neo-tree.ui.renderer').tree_is_visible
          manager._for_each_state(nil, function(s)
            if s.winid and vim.api.nvim_win_is_valid(s.winid) and visible(s)
                and (s.current_position == 'left' or s.current_position == 'right') then
              local w = utils.resolve_width(s.window.width)
              if w > 0 then vim.api.nvim_win_set_width(s.winid, w) end
            end
          end)
        end,
      })
    end,
  },
}
