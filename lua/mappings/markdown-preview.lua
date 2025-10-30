vim.keymap.set('n', '<leader>mp', '<cmd>MarkdownPreview<cr>', { desc = 'Markdown Preview' })
--
-- 2. Register the group with which-key
local wk = require("which-key")

wk.add({
  { "<leader>m", group = "Markdown" },
})
