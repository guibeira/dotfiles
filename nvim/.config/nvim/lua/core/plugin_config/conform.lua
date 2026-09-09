require("conform").setup({
	format_on_save = function(bufnr)
		if vim.bo[bufnr].filetype == "rust" then
			return { timeout_ms = 500, lsp_format = "fallback" }
		end
	end,
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		-- You can customize some of the format options for the filetype (:help conform.format)
		rust = { "rustfmt", lsp_format = "fallback" },
		-- Conform will run the first available formatter
		javascript = { "prettierd", "prettier", stop_after_first = true },
		html = { "htmlbeautifier", "prettier", stop_after_first = true },
	},
})
