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
	-- { -- neovide cursor trail
	--   "sphamba/smear-cursor.nvim",

	--   opts = {
	--     -- Smear cursor when switching buffers or windows.
	--     smear_between_buffers = true,

	--     -- Smear cursor when moving within line or to neighbor lines.
	--     -- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
	--     smear_between_neighbor_lines = true,

	--     -- Draw the smear in buffer space instead of screen space when scrolling
	--     scroll_buffer_space = true,

	--     -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
	--     -- Smears will blend better on all backgrounds.
	--     legacy_computing_symbols_support = false,

	--     -- Smear cursor in insert mode.
	--     -- See also `vertical_bar_cursor_insert_mode` and `distance_stop_animating_vertical_bar`.
	--     smear_insert_mode = true,
	--   },
	-- },
	"wbthomason/packer.nvim",
	"ellisonleao/gruvbox.nvim",
	"rebelot/kanagawa.nvim",
	"goolord/alpha-nvim",
	{
		"dracula/vim",
		lazy = false,
	},
	"folke/which-key.nvim",
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
	--{ "m4xshen/hardtime.nvim", opts = { disable_mouse = false, max_count = 10 } },
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
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
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
	-- "mfussenegger/nvim-dap",
	-- { "rcarriga/nvim-dap-ui", dependencies = "nvim-neotest/nvim-nio" },
	-- "mfussenegger/nvim-dap-python",
	--
	-- View lines at functions
	{
		"shellRaining/hlchunk.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("hlchunk").setup({
				chunk = {
					enable = true,
					highlight = "Visual",
					pattern = [[\%(\s\+\|^\)\@<=\%(\d\+\.\s\+\)\@=]],
					priority = 1000,
				},
			})
		end,
	},

	{
		"bngarren/checkmate.nvim",
		ft = "markdown", -- Lazy loads for Markdown files matching patterns in 'files'
		opts = {
			-- your configuration here
			-- or leave empty to use defaults
		},
	},

	-- rust babyyyyyyy
	{
		"saecki/crates.nvim",
		tag = "stable",
		config = function()
			require("crates").setup()
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^6", -- Recommended
		lazy = false, -- This plugin is already lazy
		dependencies = "mattn/webapi-vim",
	},
	--
	{
		"chrisgrieser/nvim-lsp-endhints",
		event = "LspAttach",
		opts = {}, -- required, even if empty
	},
	-- markdown preview
	{
		-- Install markdown preview, use npx if available.
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function(plugin)
			if vim.fn.executable("npx") then
				vim.cmd("!cd " .. plugin.dir .. " && cd app && npx --yes yarn install")
			else
				vim.cmd([[Lazy load markdown-preview.nvim]])
				vim.fn["mkdp#util#install"]()
			end
		end,
		init = function()
			if vim.fn.executable("npx") then
				vim.g.mkdp_filetypes = { "markdown" }
			end
		end,
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
				--"pyrefly",
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
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{
				"nvim-telescope/telescope-live-grep-args.nvim",
				-- This will not install any breaking changes.
				-- For major updates, this must be adjusted manually.
				version = "^1.0.0",
			},
		},
		config = function()
			local telescope = require("telescope")

			-- first setup telescope
			telescope.setup({
				-- your config
			})

			-- then load the extension
			telescope.load_extension("live_grep_args")
		end,
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
		"esmuellert/codediff.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		cmd = "CodeDiff",
		config = function()
			require("codediff").setup({
				-- Highlight configuration
				highlights = {
					-- Line-level: accepts highlight group names or hex colors (e.g., "#2ea043")
					line_insert = "DiffAdd", -- Line-level insertions
					line_delete = "DiffDelete", -- Line-level deletions

					-- Character-level: accepts highlight group names or hex colors
					-- If specified, these override char_brightness calculation
					char_insert = nil, -- Character-level insertions (nil = auto-derive)
					char_delete = nil, -- Character-level deletions (nil = auto-derive)

					-- Brightness multiplier (only used when char_insert/char_delete are nil)
					-- nil = auto-detect based on background (1.4 for dark, 0.92 for light)
					char_brightness = nil, -- Auto-adjust based on your colorscheme

					-- Conflict sign highlights (for merge conflict views)
					-- Accepts highlight group names or hex colors (e.g., "#f0883e")
					-- nil = use default fallback chain
					conflict_sign = nil, -- Unresolved: DiagnosticSignWarn -> #f0883e
					conflict_sign_resolved = nil, -- Resolved: Comment -> #6e7681
					conflict_sign_accepted = nil, -- Accepted: GitSignsAdd -> DiagnosticSignOk -> #3fb950
					conflict_sign_rejected = nil, -- Rejected: GitSignsDelete -> DiagnosticSignError -> #f85149
				},

				-- Diff view behavior
				diff = {
					disable_inlay_hints = true, -- Disable inlay hints in diff windows for cleaner view
					max_computation_time_ms = 5000, -- Maximum time for diff computation (VSCode default)
					hide_merge_artifacts = false, -- Hide merge tool temp files (*.orig, *.BACKUP.*, *.BASE.*, *.LOCAL.*, *.REMOTE.*)
					original_position = "left", -- Position of original (old) content: "left" or "right"
					conflict_ours_position = "right", -- Position of ours (:2) in conflict view: "left" or "right"
				},

				-- Explorer panel configuration
				explorer = {
					position = "bottom", -- "left" or "bottom"
					width = 40, -- Width when position is "left" (columns)
					height = 15, -- Height when position is "bottom" (lines)
					indent_markers = true, -- Show indent markers in tree view (│, ├, └)
					initial_focus = "explorer", -- Initial focus: "explorer", "original", or "modified"
					icons = {
						folder_closed = "", -- Nerd Font folder icon (customize as needed)
						folder_open = "", -- Nerd Font folder-open icon
					},
					view_mode = "list", -- "list" or "tree"
					file_filter = {
						ignore = {}, -- Glob patterns to hide (e.g., {"*.lock", "dist/*"})
					},
				},

				-- History panel configuration (for :CodeDiff history)
				history = {
					position = "bottom", -- "left" or "bottom" (default: bottom)
					width = 40, -- Width when position is "left" (columns)
					height = 15, -- Height when position is "bottom" (lines)
					initial_focus = "history", -- Initial focus: "history", "original", or "modified"
					view_mode = "list", -- "list" or "tree" for files under commits
				},

				-- Keymaps in diff view
				keymaps = {
					view = {
						quit = "q", -- Close diff tab
						toggle_explorer = "<leader>b", -- Toggle explorer visibility (explorer mode only)
						next_hunk = "]c", -- Jump to next change
						prev_hunk = "[c", -- Jump to previous change
						next_file = "]f", -- Next file in explorer mode
						prev_file = "[f", -- Previous file in explorer mode
						diff_get = "do", -- Get change from other buffer (like vimdiff)
						diff_put = "dp", -- Put change to other buffer (like vimdiff)
						toggle_stage = "-", -- Stage/unstage current file (works in explorer and diff buffers)
					},
					explorer = {
						select = "<CR>", -- Open diff for selected file
						hover = "K", -- Show file diff preview
						refresh = "R", -- Refresh git status
						toggle_view_mode = "i", -- Toggle between 'list' and 'tree' views
						stage_all = "S", -- Stage all files
						unstage_all = "U", -- Unstage all files
						restore = "X", -- Discard changes (restore file)
					},
					history = {
						select = "<CR>", -- Select commit/file or toggle expand
						toggle_view_mode = "i", -- Toggle between 'list' and 'tree' views
					},
					conflict = {
						accept_incoming = "<leader>ct", -- Accept incoming (theirs/left) change
						accept_current = "<leader>co", -- Accept current (ours/right) change
						accept_both = "<leader>cb", -- Accept both changes (incoming first)
						discard = "<leader>cx", -- Discard both, keep base
						next_conflict = "]x", -- Jump to next conflict
						prev_conflict = "[x", -- Jump to previous conflict
						diffget_incoming = "2do", -- Get hunk from incoming (left/theirs) buffer
						diffget_current = "3do", -- Get hunk from current (right/ours) buffer
					},
				},
			})
		end,
	},
	{
		"zbirenbaum/copilot.lua",
		requires = {
			"copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
		},
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = true,
					keymap = {
						accept = "<Tab>",
						accept_word = false,
						accept_line = false,
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = "<C-]>",
					},
				},
				panel = { enabled = false },
			})
		end,
	},
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
			"rachartier/tiny-inline-diagnostic.nvim",
			event = "VeryLazy", -- Or `LspAttach`
			priority = 1000, -- needs to be loaded in first
			config = function()
				require("tiny-inline-diagnostic").setup()
				vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
			end,
		},
		{
			"folke/zen-mode.nvim",
			opts = {
				window = {
					backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
					-- height and width can be:
					-- * an absolute number of cells when > 1
					-- * a percentage of the width / height of the editor when <= 1
					-- * a function that returns the width or the height
					width = 140, -- width of the Zen window
					height = 1, -- height of the Zen window
					-- by default, no options are changed for the Zen window
					-- uncomment any of the options below, or add other vim.wo options you want to apply
					options = {
						-- signcolumn = "no", -- disable signcolumn
						-- number = false, -- disable number column
						-- relativenumber = false, -- disable relative numbers
						-- cursorline = false, -- disable cursorline
						-- cursorcolumn = false, -- disable cursor column
						-- foldcolumn = "0", -- disable fold column
						-- list = false, -- disable whitespace characters
					},
				},
			},
		},
	},
}

local opts = {}

require("lazy").setup(plugins, opts)
