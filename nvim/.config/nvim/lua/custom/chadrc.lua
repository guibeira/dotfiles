-- This is an example chadrc file , its supposed to be placed in /lua/custom/

local M = {}

M.options, M.ui, M.mappings, M.plugins = {}, {}, {}, {}
-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "solarized",
}

M.plugins = {
   status = {
      terminal = false,
      blankline = true, -- show code scope with symbols
      colorizer = true, -- color RGB, HEX, CSS, NAME color codes
      dashboard = true, -- NeoVim 'home screen' on open
      truezen = true,
      neoscroll = true, -- smooth scroll
   },
   options = {
      lspconfig = {
         setup_lspconf = "custom.autoinstall",
      },
      gitsigns = {
         current_line_blame = true,
      },
      nvimtree = {
         enable_git = 1,
      },
   },
   plugin_status = {
      terminal = false,
      blankline = true, -- show code scope with symbols
      colorizer = true, -- color RGB, HEX, CSS, NAME color codes
      dashboard = true, -- NeoVim 'home screen' on open
      truezen = true,
      neoscroll = true, -- smooth scroll
   },
   -- To change the Packer `config` of a plugin that comes with NvChad,
   -- add a table entry below matching the plugin github name
   --              '-' -> '_', remove any '.lua', '.nvim' extensions
   -- this string will be called in a `require`
   --              use "(custom.configs).my_func()" to call a function
   --              use "custom.blankline" to call a file
   copilot_no_tab_map = true,
}
return M
