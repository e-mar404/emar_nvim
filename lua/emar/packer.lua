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
  use ("sainnhe/everforest")

  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  }

  use ("ThePrimeagen/harpoon")

  use ("mbbill/undotree")

  use ("tpope/vim-fugitive")

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

  use ("~/plugins/stackmap.nvim")

  use({
    "epwalsh/obsidian.nvim",
    tag = "*",  -- recommended, use latest release instead of latest commit
    requires = {
      -- Required.
      "nvim-lua/plenary.nvim",
    },

    config = function()
      require("obsidian").setup({
        workspaces = {
          {
            name = "dev-notes",
            path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/dev-notes",
          },
        },

        -- see below for full list of options 👇
      })
    end,

    notes_subdir = "notes",
    new_notes_location = "notes",
    daily_notes = {
      folder = "/daily-notes",
      templete = nil
    },

    completion = {
      nvim_cmp = true,
      min_chars = 2
    },

    mappings = {
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },

      ["<leader>ch"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },

      ["<cr>"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      }
    },

    picker = {
      name = "telescope.nvim",
      mappings = {
        new = "<C-x>",
        insertLint = "<C-l>"
      }
    }
  })
end)
