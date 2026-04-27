-- Plugin order intentionally mirrors the old single-file Kickstart setup,
-- with Metals inserted after blink so it can reuse the same completion stack.
-- Keep this list in the same order so startup behavior and dependencies do not change.
return {
  unpack(require 'plugins.guess_indent'),
  unpack(require 'plugins.gitsigns'),
  unpack(require 'plugins.which_key'),
  unpack(require 'plugins.telescope'),
  unpack(require 'plugins.lsp'),
  unpack(require 'plugins.conform'),
  unpack(require 'plugins.trouble'),
  unpack(require 'plugins.auto_save'),
  unpack(require 'plugins.blink'),
  unpack(require 'plugins.autopairs'),
  unpack(require 'plugins.dap'),
  unpack(require 'plugins.dap_scala'),
  unpack(require 'plugins.nvim_metals'),
  unpack(require 'plugins.colorscheme'),
  unpack(require 'plugins.mini'),
  unpack(require 'plugins.treesitter'),

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  -- { import = 'custom.plugins' },

  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search
}
