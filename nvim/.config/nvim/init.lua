require("core.options")
require("core.keymaps")
require("core.plugins")
require("core.plugin_config")

-- close the nvim-tree
-- j
vim.cmd([[autocmd VimEnter * NvimTreeClose]])

vim.lsp.enable("typos_lsp")

vim.lsp.config("typos_lsp", {
  -- typos-lsp must be on your PATH, or otherwise change this to an absolute path to typos-lsp
  -- defaults to typos-lsp if unspecified
  cmd = { "typos-lsp" },
  -- Logging level of the language server. Logs appear in :LspLog. Defaults to error.
  cmd_env = { RUST_LOG = "error" },
  init_options = {
    -- Custom config. Used together with a config file found in the workspace or its parents,
    -- taking precedence for settings declared in both.
    -- Equivalent to the typos `--config` cli argument.
    config = "~/code/typos-lsp/crates/typos-lsp/tests/typos.toml",
    -- How typos are rendered in the editor, can be one of an Error, Warning, Info or Hint.
    -- Defaults to Info.
    diagnosticSeverity = "Info",
  },
})
