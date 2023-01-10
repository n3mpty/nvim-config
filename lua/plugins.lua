local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)



local plugins = {
  { "folke/lazy.nvim" },
  { "nvim-lua/plenary.nvim" }, -- Useful lua functions used ny lots of plugins
  { "nvim-lua/popup.nvim" },
  { "rcarriga/nvim-notify" },
  { "MunifTanjim/nui.nvim" },

  -- ui
  { "stevearc/dressing.nvim", event = "VeryLazy" },

  -- Session
  { "rmagatti/auto-session", commit = "9639b071d9680764b6e57b08c9fa4a336453558d" },
  { "rmagatti/session-lens" },

  --
  {
    "phaazon/hop.nvim",
    event = "CursorHold",
    config = true,
  },

  {

    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup({
        mapping = { "jj" },
      })
    end,
  },

  {
    "kylechui/nvim-surround",
  },

  -- Better Scroll
  { "declancm/cinnamon.nvim", lazy = true },

  -- Rust
  { "simrat39/rust-tools.nvim", lazy = true },

  --- Comment
  { "numToStr/Comment.nvim", event = "BufRead" },
  -- File tree
  { "kyazdani42/nvim-tree.lua", lazy = true },

  --- Bufferline
  { "akinsho/bufferline.nvim", lazy = true },
  -- { "romgrk/barbar.nvim" }
  {
    "tiagovla/scope.nvim",
    config = function()
      require("scope").setup()
    end,
  },
  "moll/vim-bbye",
  "b0o/incline.nvim",

  -- Icons
  { "kyazdani42/nvim-web-devicons" },

  -- Statusline
  { "nvim-lualine/lualine.nvim" },

  -- Terminal
  { "akinsho/toggleterm.nvim" },

  -- Project
  { "ahmedkhalf/project.nvim" },
  -- Optimaizeer
  { "lewis6991/impatient.nvim" },
  -- Indent
  { "lukas-reineke/indent-blankline.nvim", lazy = true },
  -- Dashboard
  { "goolord/alpha-nvim" },
  --
  { "folke/which-key.nvim", lazy = true },

  -- Auto close pairs
  { "windwp/nvim-autopairs", event = "BufEnter" },

  -- Colorschemes
  "rktjmp/lush.nvim",
  { dir = "~/projects/khaoti-nvim", dependencies = "rktjmp/lush.nvim", event = "VeryLazy" },
  { "EdenEast/nightfox.nvim" },
  { "marko-cerovac/material.nvim" },

  -- LSP
  {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
      -- LSP Support
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "jose-elias-alvarez/null-ls.nvim",

      -- Autocompletion
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "amarakon/nvim-cmp-buffer-lines",

      -- Snippets
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
  },
  { "j-hui/fidget.nvim" },
  { "ray-x/lsp_signature.nvim" },
  { "simrat39/symbols-outline.nvim" },
  { "folke/trouble.nvim", cmd = "TroubleToggle" },
  { "smiteshp/nvim-navic" },

  -- Telescope
  { "nvim-telescope/telescope.nvim" },
  { "tom-anders/telescope-vim-bookmarks.nvim" },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "p00f/nvim-ts-rainbow",
      "nvim-treesitter/playground",
    },
  },

  -- Git
  { "lewis6991/gitsigns.nvim", lazy = true },

  -- DAP
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "ravenxrz/DAPInstall.nvim",
    },
    lazy = true
  },
  -- Visualise undo
  { "mbbill/undotree" },
  --
}

require("lazy").setup(plugins)
