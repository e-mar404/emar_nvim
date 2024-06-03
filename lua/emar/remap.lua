local map = vim.keymap.set

vim.g.mapleader = ' '
map('n', '<leader>en', ':Ex<CR>')

-- move highligheted text up and down + tab and shift tab
map('v', 'J', ':m \'>+1<CR>gv=gv')
map('v', 'K', ':m \'<-2<CR>gv=gv')
map('v', '<Tab>', '>gv')
map('v', '<S-Tab>', '<gv')

-- personal remaps
map('i', 'jj', '<Esc>');
map('v', 'fj', '<Esc>');
map('n', '<leader><leader>x', function ()
  vim.cmd('w')
  vim.cmd('so %')
end)

-- obsidian
map('n', 'gf', function()
  if require('obsidian').uitl.cursor_on_markdown_Link then
    return '<cmd>ObsidialFollowLink<CR>'
  else
    return 'gf'
  end
end, { noremap = false, expr = true})

-- LuaSnip
local ls = require('luasnip')
map({'i'}, '<C-K>', function() ls.expand() end, {silent = true})
map({'i', 's'}, '<C-L>', function() ls.jump( 1) end, {silent = true})
map({'i', 's'}, '<C-J>', function() ls.jump(-1) end, {silent = true})

map({'i', 's'}, '<C-E>', function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

-- telescope help
map('n', '<leader>th', ':Telescope help_tags<Enter>')
