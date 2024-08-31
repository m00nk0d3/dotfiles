require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
map('n', 'hn', require('harpoon.mark').add_file)
map('n', 'fh', require('harpoon.ui').toggle_quick_menu)
map('n', '-', "<CMD>Oil<CR>", { desc = "Open parent directory oil" })


