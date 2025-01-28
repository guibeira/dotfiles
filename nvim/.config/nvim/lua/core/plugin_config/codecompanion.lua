require("codecompanion").setup({
	opts = {
		send_code = true, -- Only because I'm local ollama
		language = "Portuguese",
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
	},
	strategies = {
		chat = {
			adapter = "llama3",
		},
		inline = {
			adapter = "llama3",
		},
	},
	display = {
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
