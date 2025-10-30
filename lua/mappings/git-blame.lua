vim.keymap.set("n", "<leader>lb", '<cmd>GitBlameToggle<cr>', { desc = "Toggle Git Blame for lines" })
--
-- 2. Register the group with which-key
local wk = require("which-key")

wk.add({
  { "<leader>l", group = "Git" },
})
