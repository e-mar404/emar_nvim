vim.g.mapleader = " "
vim.keymap.set("n", "<leader>en", ":Ex<CR>")

-- move highligheted text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- lsp suggestions menu navigation
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- personal remaps
vim.keymap.set("i", "jj", "<Esc>");
vim.keymap.set("v", "fj", "<Esc>");

-- obsidian
vim.keymap.set("n", "gf", function()
  if require("obsidian").uitl.cursor_on_markdown_Link then
    return '<cmd>ObsidialFollowLink<CR>'
  else
    return 'gf'
  end
end, { noremap = false, expr = true})
