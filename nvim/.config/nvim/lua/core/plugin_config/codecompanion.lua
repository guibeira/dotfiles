require("codecompanion").setup({

	opts = {
		send_code = true, -- Only because I'm local ollama
		language = "English",
	},
	adapters = {
		llama3 = function()
			return require("codecompanion.adapters").extend("ollama", {
				name = "llama3", -- Give this adapter a different name to differentiate it from the default ollama adapter
				schema = {
					model = {
						default = "deepseek-r1:latest",
					},
					num_ctx = {
						default = 16384,
					},
					num_predict = {
						default = -1,
					},
				},
			})
		end,
		openai = function()
			return require("codecompanion.adapters").extend("openai", {
				schema = {
					model = {
						default = "gpt-4o-2024-11-20",
						choices = {
							["o3-mini-2025-01-31"] = { opts = { can_reason = true } },
							["o1-2024-12-17"] = { opts = { can_reason = true } },
							["o1-mini-2024-09-12"] = { opts = { can_reason = true } },
							"claude-3.5-sonnet",
							"gpt-4o-2024-08-06",
						},
					},
				},
			})
		end,
	},
	strategies = {
		chat = {
			--adapter = "llama3",
			adapter = "anthropic",
			slash_commands = {
				["file"] = {
					callback = "strategies.chat.slash_commands.file",
					description = "Select a file using Telescope",
					opts = {
						provider = "telescope", -- Other options include 'default', 'mini_pick', 'fzf_lua', snacks
						contains_code = true,
					},
				},
			},
		},
		inline = {
			adapter = "openai",
		},
	},
	display = {
		diff = {
			enabled = true,
			close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
			layout = "vertical", -- vertical|horizontal split for default provider
			opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
			provider = "default", -- default|mini_diff
		},
		chat = {
			intro_message = "Bora codar!, ajudinha precione ?",
			show_header_separator = false, -- Show header separators in the chat buffer? Set this to false if you're using an external markdown formatting plugin
			separator = "─", -- The separator between the different messages in the chat buffer
			show_references = true, -- Show references (from slash commands and variables) in the chat buffer?
			show_settings = false, -- Show LLM settings at the top of the chat buffer?
			show_token_count = true, -- Show the token count for each response?
			start_in_insert_mode = false, -- Open the chat buffer in insert mode?
		},
	},
})
