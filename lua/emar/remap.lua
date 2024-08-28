local Map = vim.keymap.set
local tooltip = require("tooltip")

vim.g.mapleader = ' '

-- go to explore page
Map('n', '<leader>en', ':Ex<CR>')

-- will take yanked text and copy it to clipboard
Map('v', '<leader>y', '"+y')

-- move highligheted text up and down + tab and shift tab
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

-- LuaSnip
local ls = require('luasnip')
Map({'i'}, '<C-K>', function() ls.expand() end, {silent = true})
Map({'i', 's'}, '<C-L>', function() ls.jump( 1) end, {silent = true})
Map({'i', 's'}, '<C-J>', function() ls.jump(-1) end, {silent = true})

Map({'i', 's'}, '<C-E>', function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

-- universal-tooltip
Map('n', '<leader>rp', function ()
  tooltip.show()
end)
