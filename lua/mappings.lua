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
