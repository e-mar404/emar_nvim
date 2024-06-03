local lsp = require('lsp-zero')
local cmp = require('cmp')
local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

lsp.preset('recommended')

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
  mapping = {
    ['<C-l>'] = cmp.mapping.confirm({select = true}),
    ['<C-q>'] = cmp.mapping.abort(),
    ['<C-k>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
    ['<C-j>'] = cmp.mapping.select_next_item({behavior = 'select'}),
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})

lsp.on_attach(function(_ , bufnr)
	lsp.default_keymaps({
    buffer = bufnr,
    preserve_mappings = false
	})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
	  'tsserver',
	  'eslint',
	  'lua_ls',
    'html',
    'htmx',
    'gopls'
  },
  handlers = {
    lsp.default_setup,

    lua_ls = function()
      lspconfig.lua_ls.setup ({
        capabilities = lsp_capabilities,
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using
              -- (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT',
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = {'vim', color, 'P'},
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.env.VIMRUNTIME,
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
          },
        },
      })
    end,

    ltex = function()
      lspconfig.ltex.setup {}
    end,

    gopls = function()
      lspconfig.gopls.setup {}
    end,

    htmx = function ()
     lspconfig.htmx.setup {}
    end,

    cssls = function ()
      lspconfig.cssls.setup {}
    end,
  }
})

-- not on mason
lspconfig.sourcekit.setup {
  cmd = { '/Library/Developer/CommandLineTools/usr/bin/sourcekit-lsp' },
  root_dir = lspconfig.util.root_pattern('*.swift'),
}
