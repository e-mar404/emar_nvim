local lsp = require('lsp-zero')
local cmp = require('cmp')
local lspconfig = require('lspconfig')

lsp.preset('recommended')

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
  mapping = {
    ['L'] = cmp.mapping.confirm({select = false}),
    ['E'] = cmp.mapping.abort(),
    ['K'] = cmp.mapping.select_prev_item({behavior = 'select'}),
    ['J'] = cmp.mapping.select_next_item({behavior = 'select'}),
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})

lsp.on_attach(function( _ , bufnr)
	lsp.default_keymaps({
      buffer = bufnr,
    preserve_mappings = false
	})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = {
	  'tsserver',
	  'eslint',
    'ltex',
	  'lua_ls',
    'html',
  },
  handlers = {
    lsp.default_setup,
  }
})

lspconfig.lua_ls.setup {
 settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {
          'vim',
          'require',
        },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

lspconfig.sourcekit.setup {
  cmd = { '/Library/Developer/CommandLineTools/usr/bin/sourcekit-lsp' },
  root_dir = lspconfig.util.root_pattern('*.swift'),
}

lspconfig.ltex.setup {}
