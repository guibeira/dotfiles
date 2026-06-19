require('nvim-cursorline').setup {
  cursorline = {
    enable = true,
    timeout = 1000,
    number = false,
  },
  cursorword = {
    -- re-highlights every occurrence of the word on each cursor move ->
    -- churn while scrolling. Disabled for smooth scroll.
    enable = false,
    min_length = 3,
    hl = { underline = true },
  }
}

