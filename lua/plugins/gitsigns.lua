return {
  {
    'lewis6991/gitsigns.nvim',
    ---@module 'gitsigns'
    ---@type Gitsigns.Config
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, lhs, rhs, map_opts)
          map_opts = map_opts or {}
          map_opts.buffer = bufnr
          vim.keymap.set(mode, lhs, rhs, map_opts)
        end

        -- ]c / [c — jump hunks (or vanilla diff jump in diff mode)
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'Next git [c]hange' })

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Previous git [c]hange' })

        -- Visual: stage / reset selection as a hunk
        map('v', '<leader>hs', function() gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = 'git [s]tage hunk' })
        map('v', '<leader>hr', function() gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = 'git [r]eset hunk' })

        map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'git [s]tage hunk' })
        map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'git [r]eset hunk' })
        map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'git [S]tage buffer' })
        map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'git [R]eset buffer' })
        map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'git [p]review hunk' })
        map('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = 'git preview hunk [i]nline' })
        map('n', '<leader>hb', function() gitsigns.blame_line { full = true } end, { desc = 'git [b]lame line (popup)' })
        map('n', '<leader>hd', gitsigns.diffthis, { desc = 'git [d]iff vs index' })
        map('n', '<leader>hD', function() gitsigns.diffthis '@' end, { desc = 'git [D]iff vs last commit' })
        map('n', '<leader>hQ', function() gitsigns.setqflist 'all' end, { desc = 'git hunks → [Q]F (whole repo)' })
        map('n', '<leader>hq', gitsigns.setqflist, { desc = 'git hunks → [q]f (this file)' })

        -- Under `<leader>h` so they don’t clash with Trouble (`<leader>t…`).
        map('n', '<leader>hB', gitsigns.toggle_current_line_blame, { desc = 'Toggle inline [B]lame' })
        map('n', '<leader>hW', gitsigns.toggle_word_diff, { desc = 'Toggle [W]ord-diff' })

        map({ 'o', 'x' }, 'ih', gitsigns.select_hunk, { desc = 'inner git [h]unk' })
      end,
    },
  },
}
