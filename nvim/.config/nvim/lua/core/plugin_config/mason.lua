require("mason").setup()
require("mason-lspconfig").setup {
      auto_install = true,
      ensure_installed = { "lua_ls", "rust_analyzer", "pyright", "tsserver" , "codelldb", "debugpy", "isort", "black", "docker-compose-language-service", "ruff-lsp"},
}
