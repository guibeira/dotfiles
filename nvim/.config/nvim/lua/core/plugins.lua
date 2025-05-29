local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
	"wbthomason/packer.nvim",
	"ellisonleao/gruvbox.nvim",
	"rebelot/kanagawa.nvim",
	"goolord/alpha-nvim",
	{
		"dracula/vim",
		lazy = false,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	"nvimtools/none-ls.nvim",
	{
		"stevearc/conform.nvim",
		opts = {},
	},
	"kazhala/close-buffers.nvim",
	"NvChad/nvim-colorizer.lua",
	{
		"folke/flash.nvim",

		event = "VeryLazy",
		opts = {},
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },

      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
	},
	-- {
	-- 	"echasnovski/mini.nvim",
	-- 	version = "*",
	-- 	config = function()
	-- 		require("mini.pairs").setup()
	-- 	end,
	-- },
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			-- "rcarriga/nvim-notify",
		},
	},
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "LspAttach",
		opts = {
			-- options
		},
	},
	"rmagatti/auto-session",
	"yamatsum/nvim-cursorline",
	"nvim-lua/lsp-status.nvim",
	"gen740/SmoothCursor.nvim",
	"gorbit99/codewindow.nvim",
	"smjonas/live-command.nvim",
	"karb94/neoscroll.nvim",
	"declancm/cinnamon.nvim",
	"bbjornstad/pretty-fold.nvim",
	{
		"hedyhli/outline.nvim",
		config = function()
			-- Example mapping to toggle outline
			vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

			require("outline").setup({
				-- Your setup opts here (leave empty to use defaults)
			})
		end,
	},
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		config = function()
			require("chatgpt").setup()
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"folke/trouble.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
	{ "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
	{ "akinsho/git-conflict.nvim", version = "*", config = true },
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{ "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },
	-- open git
	"ruifm/gitlinker.nvim",
	{ "m4xshen/hardtime.nvim", opts = { disable_mouse = false } },
	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",
	"nvim-lualine/lualine.nvim",
	"nvim-treesitter/nvim-treesitter",
	"bluz71/vim-nightfly-colors",
	"vim-test/vim-test",
	"lewis6991/gitsigns.nvim",
	"preservim/vimux",
	"tpope/vim-fugitive",
	"tpope/vim-commentary",

	{
		"pwntester/octo.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			-- OR 'ibhagwan/fzf-lua',
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("octo").setup()
		end,
	},
	-- debug
	"mfussenegger/nvim-dap",
	{ "rcarriga/nvim-dap-ui", dependencies = "nvim-neotest/nvim-nio" },
	"mfussenegger/nvim-dap-python",

	-- rust babyyyyyyy
	{
		"mrcjkb/rustaceanvim",
		version = "^5", -- Recommended
		lazy = false, -- This plugin is already lazy
		dependencies = "mattn/webapi-vim",
	},
	{
		"chrisgrieser/nvim-lsp-endhints",
		event = "LspAttach",
		opts = {}, -- required, even if empty
	},
	-- {
	-- 	"cordx56/rustowl",
	-- 	version = "*", -- Latest stable version
	-- 	build = "cd rustowl && cargo install --path . -F installer --locked",
	-- 	lazy = false, -- This plugin is already lazy
	-- 	opts = {},
	-- },

	-- markdown preview
	{
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = {
				"markdown",
			}
		end,
		ft = { "markdown" },
	},
	{
		"toppair/peek.nvim",
		event = { "VeryLazy" },
		build = "deno task --quiet build:fast",
		config = function()
			require("peek").setup()
			vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
			vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
		end,
	},
	-- completion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-buffer", -- source for text in buffer
			"hrsh7th/cmp-path", -- source for file system paths
			"L3MON4D3/LuaSnip", -- snippet engine
			"saadparwaiz1/cmp_luasnip", -- for autocompletion
			"rafamadriz/friendly-snippets", -- useful snippets
			"onsails/lspkind.nvim", -- vs-code like pictograms
		},
	},

	"github/copilot.vim",
	"mason-org/mason.nvim",
	"neovim/nvim-lspconfig",
	{
		"mason-org/mason-lspconfig.nvim",

		opts = {
			automatic_enable = false,
			ensure_installed = {
				"cssls",
				"cmake",
				"dockerls",
				"biome",
				"eslint",
				"jsonls",
				"lua_ls",
				"marksman",
				"pyright",
				"pyrefly",
				"rust_analyzer",
				"sqlls",
				"tailwindcss",
				"ts_ls",
				"html",
				"htmx",
				"jinja_lsp",
			},
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	"nvimdev/lspsaga.nvim",
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	{
		"aaronhallaert/advanced-git-search.nvim",
		cmd = { "AdvancedGitSearch" },
		config = function()
			require("advanced_git_search.fzf").setup({
				-- Browse command to open commits in browser. Default fugitive GBrowse.
				-- {commit_hash} is the placeholder for the commit hash.
				browse_command = "GBrowse {commit_hash}",
				-- when {commit_hash} is not provided, the commit will be appended to the specified command seperated by a space
				-- browse_command = "GBrowse",
				-- => both will result in calling `:GBrowse commit`

				-- fugitive or diffview
				diff_plugin = "fugitive",
				-- customize git in previewer
				-- e.g. flags such as { "--no-pager" }, or { "-c", "delta.side-by-side=false" }
				git_flags = {},
				-- customize git diff in previewer
				-- e.g. flags such as { "--raw" }
				git_diff_flags = {},
				git_log_flags = {},
				-- Show builtin git pickers when executing "show_custom_functions" or :AdvancedGitSearch
				show_builtin_git_pickers = false,
				entry_default_author_or_date = "author", -- one of "author" or "date"
				keymaps = {
					-- following keymaps can be overridden
					toggle_date_author = "<C-w>",
					open_commit_in_browser = "<C-o>",
					copy_commit_hash = "<C-y>",
					show_entire_commit = "<C-e>",
				},

				-- Telescope layout setup
				telescope_theme = {
					function_name_1 = {
						-- Theme options
					},
					function_name_2 = "dropdown",
					-- e.g. realistic example
					show_custom_functions = {
						layout_config = { width = 0.4, height = 0.4 },
					},
				},
			})
		end,
		dependencies = {
			-- Insert Dependencies here
		},
	},
	{
		"princejoogie/dir-telescope.nvim",
		-- telescope.nvim is a required dependency
		requires = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("dir-telescope").setup({
				-- these are the default options set
				hidden = true,
				no_ignore = false,
				show_preview = true,
				follow_symlinks = false,
			})
		end,
	},
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
		opts = {
			-- -- add any opts here
			-- -- for example
			provider = "copilot",
			-- openai = {
			-- 	endpoint = "https://api.openai.com/v1",
			-- 	model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
			-- 	timeout = 30000, -- timeout in milliseconds
			-- 	temperature = 0, -- adjust if needed
			-- 	max_tokens = 4096,
			-- 	reasoning_effort = "high", -- only supported for "o" models
			-- },
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"echasnovski/mini.pick", -- for file_selector provider mini.pick
			"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
			"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
			"ibhagwan/fzf-lua", -- for file_selector provider fzf
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
	-- {
	-- 	"olimorris/codecompanion.nvim",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		-- The following are optional:
	-- 		{ "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } },
	-- 	},
	-- 	config = true,
	-- },
	{
		"kawre/leetcode.nvim",
		build = ":TSUpdate html",
		lazy = "leetcode.nvim" ~= vim.fn.argv()[1],
		opts = {
			arg = "leetcode.nvim",
			lang = "rust",
			directory = vim.fn.expand("~/leetcode"),
		},
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim", -- required by telescope
			"MunifTanjim/nui.nvim",

			-- optional
			"nvim-treesitter/nvim-treesitter",
			-- "rcarriga/nvim-notify",
			"nvim-tree/nvim-web-devicons",
		},
		{
			"folke/zen-mode.nvim",
			opts = {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			},
		},
	},
}

local opts = {}

require("lazy").setup(plugins, opts)
