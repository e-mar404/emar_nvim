local highlight = function ()
  vim.schedule(function ()
    vim.api.nvim_set_hl(0, 'SpellBad', { fg = 'red', bg = 'none', bold = true })
    vim.api.nvim_set_hl(0, 'SpellCap', { fg = 'red', bg = 'none', bold = true })
    vim.api.nvim_set_hl(0, 'SpellRare', { fg = 'red', bg = 'none', bold = true })
    vim.api.nvim_set_hl(0, 'SpellLocal', { fg = 'red', bg = 'none', bold = true })
  end)
end

vim.api.nvim_create_autocmd('BufWinEnter', {
  group = vim.api.nvim_create_augroup('SpellChecker', { clear = true }),
  callback = function ()
    highlight()
  end,
})
