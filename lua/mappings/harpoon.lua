local harpoon = require("harpoon")


vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Open add to harpoon" })
vim.keymap.set("n", "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Toggle quick menu" })

vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end, { desc = "Select item at list position 1" })
vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end, { desc = "Select item at list position 2" })
vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end, { desc = "Select item at list position 3" })
vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end, { desc = "Select item at list position 4" })
vim.keymap.set("n", "<leader>h5", function() harpoon:list():select(5) end, { desc = "Select item at list position 5" })
vim.keymap.set("n", "<leader>h6", function() harpoon:list():select(6) end, { desc = "Select item at list position 6" })
vim.keymap.set("n", "<leader>h7", function() harpoon:list():select(7) end, { desc = "Select item at list position 7" })
vim.keymap.set("n", "<leader>h8", function() harpoon:list():select(8) end, { desc = "Select item at list position 8" })
vim.keymap.set("n", "<leader>h9", function() harpoon:list():select(9) end, { desc = "Select item at list position 9" })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>ho", function() harpoon:list():prev() end, { desc = "Go to prev item in harpoon list" })
vim.keymap.set("n", "<leader>hi", function() harpoon:list():next() end, { desc = "Go to next item in harpoon list" })
