require("gitsigns").setup()

vim.keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { silent = true })
-- reset hunk
vim.keymap.set("n", "<leader>gr", "<cmd>lua require('gitsigns').reset_hunk()<CR>", { silent = true })
-- diff file
vim.keymap.set("n", "<leader>gd", "<cmd>lua require('gitsigns').diffthis()<CR>", { silent = true })
