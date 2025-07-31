local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		-- typo
		null_ls.builtins.completion.spell,
		-- docker
		-- null_ls.builtins.diagnostics.dotenv_linter,
		-- null_ls.builtins.diagnostics.hadolint,
		-- python
		null_ls.builtins.formatting.isort,
		null_ls.builtins.formatting.black.with({
			extra_args = { "--line-length", "120" },
		}),
		null_ls.builtins.diagnostics.mypy,
		null_ls.builtins.diagnostics.djlint,
		null_ls.builtins.formatting.djlint.with({
			extra_args = { "--profile", "jinja" },
		}),
		-- null_ls.builtins.diagnostics.vulture,
		--css
		-- null_ls.builtins.formatting.stylelint,
		-- rust
		-- null_ls.builtins.formatting.dxfmt,
		null_ls.builtins.formatting.leptosfmt,
		--lua
		null_ls.builtins.formatting.stylua,
		-- javascript
		-- null_ls.builtins.formatting.biome,
		-- null_ls.builtins.formatting.prettier,
		-- terraform
		null_ls.builtins.diagnostics.terraform_validate,
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
