return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      terminal = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      scope = { enabled = true },
      words = { enabled = true },
      statuscolumn = { enabled = true },
      bigfile = { enabled = true },
      quickfix = { enabled = true },
    },
    keys = {
      -- Terminal
      { "<C-\\>", function() Snacks.terminal.toggle() end, desc = "Toggle Terminal", mode = { "n", "t" } },

      -- Buffers
      { "<leader>bd", function() Snacks.bufdelete() end, desc = "[B]uffer [D]elete" },

      -- Git
      { "<leader>gb", function() Snacks.gitbrowse() end, desc = "[G]it [B]rowse" },
      { "<leader>gl", function() Snacks.git.log() end, desc = "[G]it [L]og" },
    },
  },
}
