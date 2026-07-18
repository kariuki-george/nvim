require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

vim.opt.mouse = "a"
vim.opt.scrolloff = 10
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
--
-- vim.keymap.set("n", "<C-h>", "C-left>", { desc = "Move focus to the left win-left>
-- vim.keymap.set("n", "<C-l>", "C-right", { desc = "Move focus to the right window" })
-- vim.keymap.set("n", "<C-j>", "<C-up>", { desc = "Move focus to the lower window" })
-- vim.keymap.set("n", "<C-k>", "<C-down>", { desc = "Move focus to the upper window" })
--
--

-- copilot 
map('i', '<C-l>', function ()
  vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
end, { desc = 'Copilot Accept', noremap = true, silent = true })


map("n", "<leader>gi", function()
  require("nvim-tree.api").tree.toggle_gitignore_filter()
end, { desc = "Toggle git ignored files" })

-- lsp_lines setup 
vim.diagnostic.config({
  virtual_text = true,
  virual_lines = false
})
