require("codewindow.config").setup({ use_treesitter = false })

local codewindow = require("codewindow")
codewindow.setup({
  active_in_terminals = false,
  auto_enable = false,
  exclude_filetypes = { "help" },
  max_minimap_height = nil,
  max_lines = nil,
  minimap_width = 20,
  use_lsp = true,
  use_treesitter = false,
  use_git = true,
  width_multiplier = 4,
  z_index = 1,
  show_cursor = true,
  window_border = "single",
  relative = "editor",
  events = { "TextChanged", "InsertLeave", "DiagnosticChanged", "FileWritePost" },
})
codewindow.apply_default_keybinds()
