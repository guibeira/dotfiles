local harpoon = require("harpoon")
-- REQUIRED
harpoon:setup({
	-- Setting up custom behavior for a list named "cmd"
	["cmd"] = {
		-- When you call list:add() this function is called and the return
		-- value will be put in the list at the end.
		--
		-- which means same behavior for prepend except where in the list the
		-- return value is added
		--
		-- @param possible_value string only passed in when you alter the ui manual
		add = function(possible_value)
			-- get the current line idx
			local idx = vim.fn.line(".")
			-- read the current line
			local cmd = vim.api.nvim_buf_get_lines(0, idx - 1, idx, false)[1]
			if cmd == nil then
				return nil
			end
			return {
				value = cmd,
				context = { -- any data you want
				},
			}
		end,
		--- This function gets invoked with the options being passed in from
		--- list:select(index, <...options...>)
		--- @param list_item {value: any, context: any}
		--- @param list { ... }
		--- @param option any
		select = function(list_item, list, option)
			-- WOAH, IS THIS HTMX LEVEL XSS ATTACK??
			vim.cmd(list_item.value)
		end,
	},
})

-- REQUIRED

vim.keymap.set("n", "<leader>i", function()
	harpoon:list():add()
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-j>", function()
	harpoon:list():prev()
end)
vim.keymap.set("n", "<C-k>", function()
	harpoon:list():next()
end)

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Harpoon",
			finder = require("telescope.finders").new_table({
				results = file_paths,
			}),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),
		})
		:find()
end

vim.keymap.set("n", "<C-e>", function()
	toggle_telescope(harpoon:list())
end, { desc = "Open harpoon window" })
