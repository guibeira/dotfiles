-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- Move selected line / block of text in visual mode
vim.keymap.set("n", "<C-s>", ":w<cr>")
vim.keymap.set("n", "<leader>t", ":tabnew<cr>")
vim.keymap.set("n", "<S-H>", ":bp<cr>")
vim.keymap.set("n", "<S-L>", ":bn<cr>")
-- close buffer
-- vim.keymap.set('n', "<Leader>c", ":BDelete this<cr>")
vim.keymap.set("n", "<c-c>", ":BDelete this<cr>")

vim.keymap.set(
	"n",
	"<space><space>",
	":lua require('telescope.builtin').live_grep({grep_open_files=true})<CR>",
	{ noremap = true }
)
vim.keymap.set("n", "<leader>fd", "<cmd>Telescope dir live_grep<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>pg", "<cmd>Telescope dir find_files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>ff", ":Telescope find_files<cr>")
vim.keymap.set("n", "<Leader>fg", ":Telescope git_files<cr>")

-- telescope preview colorscheme
vim.keymap.set("n", "<Leader>pc", ":Telescope colorscheme <cr>")

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
