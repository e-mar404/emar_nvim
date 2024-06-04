local Map = vim.keymap.set

vim.g.mapleader = ' '

Map('n', '<leader>en', ':Ex<CR>')

-- will take yanked text and copy it to clipboard
Map('v', '<leader>y', '"+y')

-- move highligheted text up and down + tab and shift tab
Map('v', 'J', ':m \'>+1<CR>gv=gv')
Map('v', 'K', ':m \'<-2<CR>gv=gv')
Map('v', '<Tab>', '>gv')
Map('v', '<S-Tab>', '<gv')

-- personal remaps
Map('i', 'jj', '<Esc>');
Map('v', 'fj', '<Esc>');
Map('n', '<leader><leader>x', function ()
  vim.cmd('w')
  vim.cmd('so %')
end)

-- obsidian
Map('n', 'gf', function()
  if require('obsidian').uitl.cursor_on_markdown_Link then
    return '<cmd>ObsidialFollowLink<CR>'
  else
    return 'gf'
  end
end, { noremap = false, expr = true})

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
