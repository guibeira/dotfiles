local servers = {
	"cssls",
	"cmake",
	"dockerls",
	"eslint",
	"jsonls",
	"lua_ls",
	"marksman",
	"pyright",
	"rust_analyzer",
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

local cmp = require("cmp")

local luasnip = require("luasnip")

local lspkind = require("lspkind")

-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	completion = {
		completeopt = "menu,menuone,preview,noselect",
	},
	snippet = { -- configure how nvim-cmp interacts with snippet engine
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<S-Space>"] = cmp.mapping.complete(), -- show completion suggestions
		["<C-e>"] = cmp.mapping.abort(), -- close completion window
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	}),
	-- sources for autocompletion
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" }, -- snippets
		{ name = "buffer" }, -- text within current buffer
		{ name = "path" }, -- file system paths
	}),
	-- configure lspkind for vs-code like pictograms in completion menu
	formatting = {
		format = lspkind.cmp_format({
			maxwidth = 50,
			ellipsis_char = "...",
		}),
	},
})
