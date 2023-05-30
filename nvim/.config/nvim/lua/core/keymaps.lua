-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Move selected line / block of text in visual mode
vim.keymap.set('n', "<C-s>", ":w<cr>")
vim.keymap.set('n', "<S-T>", ":tabnew<cr>")
vim.keymap.set('n', "<S-H>", ":bp<cr>")
vim.keymap.set('n', "<S-L>", ":bn<cr>")
-- close buffer
-- vim.keymap.set('n', "<Leader>c", ":BDelete this<cr>")
vim.keymap.set('n', "<c-c>", ":BDelete this<cr>")

vim.keymap.set('n', "<Leader>o", ":Telescope live_grep<cr>")
vim.keymap.set('n', "<Leader>ff", ":Telescope find_files<cr>")
vim.keymap.set('n', "<Leader>fg", ":Telescope git_files<cr>")

