vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	api.config.mappings.default_on_attach(bufnr)

	vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
	-- open vertical split
	vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
	-- open horizontal split
	vim.keymap.set("n", "s", api.node.open.horizontal, opts("Open: Horizontal Split"))
	vim.keymap.del("n", "<C-k>", { buffer = bufnr })
	vim.keymap.set("n", "<S-k>", api.node.open.preview, opts("Open Preview"))
end

require("nvim-tree").setup({
	on_attach = my_on_attach,
	view = {
		adaptive_size = false,
	},
})

vim.keymap.set("n", "<c-n>", ":NvimTreeFindFileToggle<CR>")
