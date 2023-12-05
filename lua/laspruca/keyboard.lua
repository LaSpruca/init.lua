local telescope = require("telescope.builtin")
local harpoon = require("harpoon")

-- Telescope
vim.keymap.set("n", "<leader>ff", telescope.find_files, {})
vim.keymap.set("n", "<leader>fg", telescope.live_grep, {})
vim.keymap.set("n", "<leader>fb", telescope.buffers, {})
vim.keymap.set("n", "<leader>fh", telescope.help_tags, {})

-- Sidebar
vim.keymap.set("n", "<leader>ss", ":NvimTreeOpen<CR>")
vim.keymap.set("n", "<leader>s+", ":NvimTreeResize +20<CR>")
vim.keymap.set("n", "<leader>s-", ":NvimTreeResize -20<CR>")

-- Harpoon
vim.keymap.set("n", "<leader>a", function()
	harpoon:list():append()
end)
vim.keymap.set("n", "<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<C-h>", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<C-t>", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<C-n>", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<C-s>", function()
	harpoon:list():select(4)
end)
