local servers = {
	"cssls",
	"cmake",
	"dockerls",
	"eslint",
	"jsonls",
	"lua_ls",
	"marksman",
	"pyright",
	-- "ruff_lsp",
	-- "rust_analyzer",
	"sqlls",
	"tailwindcss",
	"ts_ls",
	"volar",
	"html",
	"htmx",
	"jinja_lsp",
}

require("mason-lspconfig").setup({
	ensure_installed = servers,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- require("lspconfig").ruff_lsp.setup({
-- 	init_options = {
-- 		settings = {
-- 			args = {},
-- 		},
-- 	},
-- })

require("lspconfig").lua_ls.setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

for _, server in ipairs(servers) do
	require("lspconfig")[server].setup({
		capabilities = capabilities,
	})
end
