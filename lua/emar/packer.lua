--{This file can be loaded by calling `lua require("plugins")` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  use {
    "nvim-telescope/telescope.nvim", tag = "0.1.5",
    -- or                            , branch = "0.1.x",
    requires = { {"nvim-lua/plenary.nvim"} }
  }

  -- color themes
  --[[
  use ({
    "rose-pine/neovim",
    as = "rose-pine",
    config = function()
      vim.cmd("colorscheme rose-pine");
    end
  })

  use ({
    "embark-theme/vim",
    as = "embark",
    config = function()
        vim.cmd("colorscheme embark");
    end
  })
  
  use ("savq/melange-nvim")
  use ("sts10/vim-pink-moon")
  ]]--
  use "sainnhe/everforest"

  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  }

  use "ThePrimeagen/harpoon"
  use "ThePrimeagen/vim-be-good"

  use "mbbill/undotree"

  use "tpope/vim-fugitive"

  use({
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!:).
    run = "make install_jsregexp"
  })

  use {
	  "VonHeikemen/lsp-zero.nvim",
	  branch = "v3.x",
	  requires = {
		  --- Uncomment the two plugins below if you want to manage the language servers from neovim
		  {"williamboman/mason.nvim"},
		  {"williamboman/mason-lspconfig.nvim"},

		  -- LSP Support
		  {"neovim/nvim-lspconfig"},
		  -- Autocompletion
		  {"hrsh7th/nvim-cmp"},
		  {"hrsh7th/cmp-nvim-lsp"},
		  {"L3MON4D3/LuaSnip"},
	  },
  }

  -- personal plugins
  -- dev
  use "~/plugins/tooltip.nvim"

  -- prod
  -- use "e-mar404/tooltip.nvim"

  -- TODO: see about getting obsidian set up
end)
