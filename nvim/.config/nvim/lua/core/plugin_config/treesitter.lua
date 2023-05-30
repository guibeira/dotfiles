require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { 
    "bash",
    "c",
    "css",
    "javascript",
    "json",
    "lua",
    "python",
    "rust",
    "toml",
    "tsx",
    "typescript",
    "yaml",
    "vim",
    "markdown",
    "markdown_inline"
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
