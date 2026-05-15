return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      terminal = {
        win = {
          style = "float",
          width = 0.8,
          height = 0.8,
          border = "rounded",
          title = "  Terminal ",
          title_pos = "center",
          footer_keys = true,
          backdrop = 60,
        },
      },
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
      { "<leader><leader>", function() Snacks.picker.buffers() end, desc = "[ ] Find existing buffers" },

      -- Search
      { "<leader>sf", function() Snacks.picker.files() end, desc = "[S]earch [F]iles" },
      { "<leader>sg", function() Snacks.picker.grep() end, desc = "[S]earch by [G]rep" },
      { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "[S]earch current [W]ord", mode = { "n", "v" } },
      { "<leader>sb", function() Snacks.picker.buffers() end, desc = "[S]earch [B]uffers" },
      { "<leader>sh", function() Snacks.picker.help() end, desc = "[S]earch [H]elp" },
      { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "[S]earch [K]eymaps" },
      { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "[S]earch [D]iagnostics" },
      { "<leader>sc", function() Snacks.picker.commands() end, desc = "[S]earch [C]ommands" },
      { "<leader>/", function() Snacks.picker.lines() end, desc = "[/] Fuzzily search in current buffer" },
      { "<leader>s/", function() Snacks.picker.grep({ buffers = true }) end, desc = "[S]earch [/] in Open Files" },

      -- LSP
      { "glr", function() Snacks.picker.lsp_references() end, desc = "[G]oto [R]eferences" },
      { "gld", function() Snacks.picker.lsp_definitions() end, desc = "[G]oto [D]efinition" },
      { "gli", function() Snacks.picker.lsp_implementations() end, desc = "[G]oto [I]mplementation" },
      { "glt", function() Snacks.picker.lsp_type_definitions() end, desc = "LSP [T]ype definition" },
      { "gO", function() Snacks.picker.lsp_symbols() end, desc = "Open Document Symbols" },
      { "gW", function() Snacks.picker.lsp_workspace_symbols() end, desc = "Open Workspace Symbols" },

      -- Git
      { "<leader>gb", function() Snacks.gitbrowse() end, desc = "[G]it [B]rowse" },
      { "<leader>gl", function() Snacks.picker.git_log() end, desc = "[G]it [L]og" },
      { "<leader>gs", function() Snacks.picker.git_status() end, desc = "[G]it [S]tatus" },

      -- Words
      { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
      { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
    },
  },
}
