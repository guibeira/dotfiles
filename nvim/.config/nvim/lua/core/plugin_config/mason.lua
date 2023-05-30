require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {
     "bash-language-server",
     "css-lsp",
     "dockerfile-language-server",
     "html-lsp",
     "json-lsp",
     "lemminx",
     "lua-language-server",
     "pyright",
     "rust-analyzer",
     "tailwindcss-language-server",
     "typescript-language-server",
     "vim-language-server",
     "vue-language-server",
     "yaml-language-server",
  },
}
