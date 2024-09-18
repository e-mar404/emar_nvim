local tooltip = require("tooltip")
local Map = vim.keymap.set

vim.g.mapleader = ' '

-- go to explore page
Map('n', '<leader>en', ':Ex<CR>')

-- will take yanked text and copy it to clipboard
Map('v', '<leader>y', '"+y')

-- move highlighted text up and down + tab and shift tab
Map('v', 'J', ':m \'>+1<CR>gv=gv')
Map('v', 'K', ':m \'<-2<CR>gv=gv')
Map('v', '<Tab>', '>gv')
Map('v', '<S-Tab>', '<gv')

-- plenary.nvim
Map('n', '<leader>t', '<Plug>PlenaryTestFile')

-- personal remaps
Map('i', 'jj', '<Esc>');
Map('v', 'fj', '<Esc>');
Map('n', '<leader><leader>x', function ()
  vim.cmd('w')
  vim.cmd('so %')
end)
Map('n', '<leader>d', 'r✓')

-- universal-tooltip
Map('n', '<leader><leader>r', function ()
  tooltip.show()
end)
