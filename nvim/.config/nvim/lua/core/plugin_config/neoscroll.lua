require("neoscroll").setup({
  -- All these keys will be mapped to their corresponding default scrolling animation
  mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
  hide_cursor = true,         -- Hide cursor while scrolling
  stop_eof = true,            -- Stop at <EOF> when scrolling downwards
  use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
  respect_scrolloff = false,  -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
  -- neoscroll v2 API (old easing_function key was ignored):
  performance_mode = false,   -- disable highlight while scrolling -> kills the stutter
  easing = "sine",            -- smooth deceleration, better than linear
  duration_multiplier = 0.8,  -- shorter/snappier scroll
  pre_hook = nil,             -- Function to run before the scrolling animation starts
  post_hook = nil,            -- Function to run after the scrolling animation ends
})

-- Mouse wheel does not go through neoscroll's mappings (keyboard only). By
-- default each tick = abrupt 3-line jump (mousescroll ver:3), no animation ->
-- feels janky. Route the wheel through neoscroll to animate like C-d. Passing
-- explicit lines also avoids nvim 0.10+ fractional-delta flooring under tmux.
local neoscroll = require("neoscroll")
local function wheel(lines)
  return function()
    neoscroll.scroll(lines, { move_cursor = false, duration = 80, easing = "sine" })
  end
end
vim.keymap.set({ "n", "v", "i" }, "<ScrollWheelUp>", wheel(-3), { silent = true })
vim.keymap.set({ "n", "v", "i" }, "<ScrollWheelDown>", wheel(3), { silent = true })
