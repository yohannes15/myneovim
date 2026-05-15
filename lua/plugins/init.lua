-- Plugin order intentionally mirrors the old single-file Kickstart setup,
-- with Metals inserted after blink so it can reuse the same completion stack.
-- Keep this list in the same order so startup behavior and dependencies do not change.
return {
  unpack(require 'plugins.guess_indent'),
  unpack(require 'plugins.gitsigns'),
  unpack(require 'plugins.which_key'),
  unpack(require 'plugins.neo_tree'),
  unpack(require 'plugins.lsp'),
  unpack(require 'plugins.conform'),
  unpack(require 'plugins.trouble'),
  unpack(require 'plugins.todo_comments'),
  unpack(require 'plugins.auto_save'),
  unpack(require 'plugins.blink'),
  unpack(require 'plugins.autopairs'),
  unpack(require 'plugins.dap'),
  unpack(require 'plugins.nvim_metals'),
  unpack(require 'plugins.colorscheme'),
  unpack(require 'plugins.treesitter'),
  unpack(require 'plugins.render_markdown'),
  unpack(require 'plugins.mini'),
  unpack(require 'plugins.harpoon'),
  unpack(require 'plugins.snacks'),
  unpack(require 'plugins.vim_be_good'),

  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use snacks picker!
  -- In normal mode type `<space>sh` then write `snacks-picker`
  -- you can continue same window with `<space>sr` which resumes last picker search
}
