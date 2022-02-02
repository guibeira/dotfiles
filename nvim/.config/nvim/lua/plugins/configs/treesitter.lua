local present, ts_config = pcall(require, "nvim-treesitter.configs")

if not present then
   return
end

ts_config.setup {
   ensure_installed = {
      "bash",
      "dot",
      "html",
      "javascript",
      "json",
      "lua",
      "make",
      "markdown",
      "query",
      "rust",
      "scss",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vue",
      "yaml"
   },
   highlight = {
      enable = true,
      use_languagetree = true,
   },
}
