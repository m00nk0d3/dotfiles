local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- open oil.nvim
map("n", "-", ":Oil<cr>", opts)

-- Telescope
local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, {desc = 'find files'})
map('n', '<leader>fg', builtin.live_grep, {desc = 'live grep'})
map('n', '<leader>fb', builtin.buffers, {desc = 'find buffers'})
map('n', '<leader>fh', builtin.help_tags, {desc = 'find help'})
-- map harpoon
map('n', '<leader>a', ':lua require("harpoon.mark").add_file()<cr>', opts)
map('n', '<leader>h', ':lua require("harpoon.ui").toggle_quick_menu()<cr>', opts)
