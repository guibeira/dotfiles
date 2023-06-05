local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		-- typo
		null_ls.builtins.diagnostics.cspell,
		null_ls.builtins.code_actions.cspell,
		null_ls.builtins.completion.spell,
		-- python
		null_ls.builtins.formatting.isort,
		null_ls.builtins.formatting.black,
		null_ls.builtins.diagnostics.mypy,
		null_ls.builtins.diagnostics.ruff,
		--lua
		null_ls.builtins.formatting.stylua,
		-- javascript
		null_ls.builtins.diagnostics.eslint,
	},

	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
					vim.lsp.buf.format({ async = false })
				end,
			})
		end
	end,
})
