local builtin = require('telescope.builtin')
local Map = vim.keymap.set

Map('n', '<leader>pf', builtin.find_files, {})
Map('n', '<leader>pg', builtin.git_files, {})
Map('n', '<leader>lg', builtin.live_grep, {})
Map('n', '<leader>fb', builtin.buffers, {})
Map('n', '<leader>th', ':Telescope help_tags<Enter>')
