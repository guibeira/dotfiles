local wk = require("which-key")
wk.add({
	{ "<leader>f", group = "file" }, -- group
	{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
	{
		"<leader>fb",
		function()
			print("hello")
		end,
		desc = "Foobar",
	},
	{ "<leader>ga", "<cmd>Gitsigns stage_buffer<cr>", desc = "Stage File" },
	{ "<leader>gc", "<cmd>Gitsigns reset_buffer  <cr>", desc = "Reset changes from the file" },
	{ "<leader>f1", hidden = true }, -- hide this keymap
	{ "<leader>w", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings

	--vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
	{ "<leader>h", "<cmd>nohlsearch<cr>", desc = "No Highlight" },

	-- format code
	--vim.keymap.set("n", "<Leader>,", ":lua vim.lsp.buf.format({ async = false })<cr>")
	{ "<leader>,", "<cmd>lua vim.lsp.buf.format({ async = false })<cr>", desc = "Format Code" },
	{
		"<leader>b",
		group = "buffers",
		expand = function()
			return require("which-key.extras").expand.buf()
		end,
	},
	-- codecompanions
	{ "<C-a>", "<cmd>CodeCompanionActions<cr>", desc = "Code Companion Actions", mode = { "n", "v" } },
	{ "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle Code Companion Chat", mode = { "n", "v" } },
	{ "ga", "<cmd>CodeCompanionChat Add<cr>", desc = "Add Code Companion Chat", mode = "v" },
	-- resize windows
	{ "<C-S-Right>", "<cmd>vertical resize +2<cr>", desc = "Resize Right", mode = "n" },
	{ "<C-S-Left>", "<cmd>vertical resize -2<cr>", desc = "Resize Left", mode = "n" },
	{ "<C-S-Up>", "<cmd>resize +2<cr>", desc = "Resize Up", mode = "n" },
	{ "<C-S-Down>", "<cmd>resize -2<cr>", desc = "Resize Down", mode = "n" },
	{
		-- Nested mappings are allowed and can be added in any order
		-- Most attributes can be inherited or overridden on any level
		-- There's no limit to the depth of nesting
		mode = { "n", "v" }, -- NORMAL and VISUAL mode
		{ "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
		{ "<leader>w", "<cmd>w<cr>", desc = "Write" },
	},
})
