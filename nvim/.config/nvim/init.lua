require("core.options")
require("core.keymaps")
require("core.plugins")
require("core.plugin_config")

-- close the nvim-tree
vim.cmd([[autocmd VimEnter * NvimTreeClose]])
