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

-- III Engine LSP (custom, not managed by mason)
local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")
if not configs.iii_lsp then
	configs.iii_lsp = {
		default_config = {
			--cmd = { "/Users/doggao/personal/workers/iii-lsp/target/release/iii-lsp" },
			cmd = { "/Users/doggao/personal/workers/iii-lsp/target/release/iii-lsp" },

			filetypes = { "typescript", "typescriptreact", "python", "rust" },
			root_dir = function(fname)
				return lspconfig.util.find_git_ancestor(fname) or vim.fn.getcwd()
			end,
		},
	}
end
lspconfig.iii_lsp.setup({})

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
