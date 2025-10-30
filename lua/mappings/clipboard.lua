-- Yank visual selection to system clipboard
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = true, desc = "Yank visual selection to clipboard" })

-- Yank from cursor to the last non-blank character of the line to system clipboard
vim.api.nvim_set_keymap('n', '<leader>Y', '"+yg_', { noremap = true, silent = true, desc = "Yank to line end (non-blank) to clipboard" })

-- Yank with a motion (e.g., <leader>yw for a word) to system clipboard
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true, silent = true, desc = "Yank (operator) to clipboard" })

-- Yank the entire current line to system clipboard
vim.api.nvim_set_keymap('n', '<leader>yy', '"+yy', { noremap = true, silent = true, desc = "Yank current line to clipboard" })

-- Paste from system clipboard after the cursor (Normal mode)
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', { noremap = true, silent = true, desc = "Paste from clipboard after cursor" })

-- Paste from system clipboard before the cursor (Normal mode)
vim.api.nvim_set_keymap('n', '<leader>P', '"+P', { noremap = true, silent = true, desc = "Paste from clipboard before cursor" })

-- Replace the visually selected text with content from the system clipboard
vim.api.nvim_set_keymap('v', '<leader>p', '"+p', { noremap = true, silent = true, desc = "Paste/replace selection from clipboard" })

-- Replace the visually selected text with content from the system clipboard
vim.api.nvim_set_keymap('v', '<leader>P', '"+P', { noremap = true, silent = true, desc = "Paste/replace selection from clipboard" })

-- 2. Register the group with which-key
local wk = require("which-key")

wk.add({
  { "<leader>p", group = "Paste" },
  { "<leader>y", group = "Copy" },
})
