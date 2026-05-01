return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      terminal = { enabled = true }, --split/floating terminal
      indent = { enabled = true }, -- indent guides and scopes
      input = { enabled = true }, -- better input
      notifier = { enabled = true }, -- prettier notifier
      scope = { enabled = true }, -- scope highlighting / jump / visual 
      words = { enabled = true }, -- word highlighting and jump word refs
      statuscolumn = { enabled = true }, -- pretty status column
      bigfile = { enabled = true }, -- deal with big files
      picker = { enabled = true }, -- selecting items
    },
    keys = {
      -- Terminal
      { "<C-\\>", function() Snacks.terminal.toggle() end, desc = "Toggle Terminal", mode = { "n", "t" } },

      -- Buffers
      { "<leader>bd", function() Snacks.bufdelete() end, desc = "[B]uffer [D]elete" },

      -- Git
      { "<leader>gb", function() Snacks.gitbrowse() end, desc = "[G]it [B]rowse" },
      { "<leader>gl", function() Snacks.picker.git_log() end, desc = "[G]it [L]og" },

      -- Words
      { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
      { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
    },
  },
}
