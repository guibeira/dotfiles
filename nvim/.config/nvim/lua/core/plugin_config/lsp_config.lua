local servers = {
	"cssls",
	"biome",
	"cmake",
	"dockerls",
	"eslint",
	"jsonls",
	"lua_ls",
	"marksman",
	"pyright",
	"bacon-ls",
	"sqlls",
	"tailwindcss",
	"ts_ls",
	"html",
	"htmx",
	"jinja_lsp",
	"proton_ls",
	-- "pyrefly",
}

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, server in ipairs(servers) do
	vim.lsp.enable(server)
	vim.lsp.config(server, {
		capabilities = capabilities,
	})
end

-- Lua customization
vim.lsp.enable("lua_ls")

vim.lsp.config("lua_ls", {
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
