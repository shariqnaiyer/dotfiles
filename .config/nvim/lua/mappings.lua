require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Markdown keymaps
map("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Markdown Preview Toggle" })
map("v", "<leader>mb", "c****<Esc>hP", { desc = "Markdown Bold selection" })
map("v", "<leader>mi", "c**<Esc>P", { desc = "Markdown Italic selection" })
map("v", "<leader>mc", "c``<Esc>P", { desc = "Markdown Code selection" })
