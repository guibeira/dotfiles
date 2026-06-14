local ok, ts = pcall(require, "nvim-treesitter")
if not ok or type(ts.install) ~= "function" then
	vim.schedule(function()
		vim.notify(
			"nvim-treesitter rewrite not installed yet. Run :Lazy update nvim-treesitter",
			vim.log.levels.WARN
		)
	end)
	return
end

local parsers = {
	"bash",
	"c",
	"css",
	"javascript",
	"json",
	"lua",
	"markdown",
	"markdown_inline",
	"python",
	"rust",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vue",
	"yaml",
}

ts.install(parsers)

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"bash",
		"sh",
		"c",
		"css",
		"javascript",
		"javascriptreact",
		"json",
		"lua",
		"markdown",
		"python",
		"rust",
		"toml",
		"typescript",
		"typescriptreact",
		"vim",
		"vue",
		"yaml",
	},
	callback = function()
		pcall(vim.treesitter.start)
	end,
})
