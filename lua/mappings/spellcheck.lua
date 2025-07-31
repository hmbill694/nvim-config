local map = vim.keymap.set

-- Toggle spelll checking on and off
map('n', '<leader>sa', function() vim.cmd('set spell!') end, { desc = "Toggle Spell Check" })

-- Move to the next misspelled word
-- The built-in command ']' followed by 's' moves to the next spelling error.
map('n', '<leader>sn', ']s', { desc = "Next Misspelled Word" })

-- Move to the previous misspelled word
-- The built-in command '[' followed by 's' moves to the previous spelling error.
map('n', '<leader>sp', '[s', { desc = "Previous Misspelled Word" })

-- Open a list of suggestions for the word under the cursor
-- The built-in command 'z=' opens a suggestion list.
map('n', '<leader>sg', 'z=', { desc = "Spell Suggestions" })


