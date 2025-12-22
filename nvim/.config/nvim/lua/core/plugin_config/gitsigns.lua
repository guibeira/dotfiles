require("gitsigns").setup()

vim.keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { silent = true })
-- reset hunk
vim.keymap.set("n", "<leader>gr", "<cmd>lua require('gitsigns').reset_hunk()<CR>", { silent = true })
-- toogle blane line
vim.keymap.set("n", "<leader>gb", "<cmd>lua require('gitsigns').toggle_current_line_blame()<CR>", { silent = true })
