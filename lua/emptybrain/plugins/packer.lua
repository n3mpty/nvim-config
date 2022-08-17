local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use({

    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  })
  use({
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
  })
  -- use({
  --
  --   "folke/persistence.nvim",
  --   event = "BufReadPre", -- this will only start session saving when an actual file was opened
  --   module = "persistence",
  --   config = function()
  --     require("persistence").setup {
  --       dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
  --       options = { "buffers", "curdir", "tabpages", "winsize" },
  --     }
  --   end,
  -- })
  use({
    "Shatur/neovim-session-manager",
    as = "session_manager",
    cmd = "SessionManager",
    event = "BufWritePost",
  })
  use({

    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require "lsp_signature".on_attach({
        bind = true,
        handlers_opts = {
          border = "single",
          hint_prefix = '🐀',
        }
      })
    end,
  })
  use({
    "phaazon/hop.nvim",
    branch = 'v2',
    event = "BufRead"
  })

  use({

    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup({
        mapping = { "jj" },
      })

    end,
  })
  use({

    "edluffy/specs.nvim",
    config = function()
      require('specs').setup({
        show_jumps = true,
        min_jump = 2,
        popup = {
          inc_ms = 10,
          blend = 10,
          width = 20,
          winhl = "Pmenu",
          fader = require('specs').linear_fader,
          resizer = require('specs').shrink_resizer
        },
        ignore_filetypes = {},
        ignore_buftypes = {
          nofile = true,
        }
      })
    end,
  })
  use({
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })
  use({
      "wakatime/vim-wakatime"
  })
  use({
    "norcalli/nvim-colorizer.lua"
  })

  use({
    "kshenoy/vim-signature"
  })

  use({"karb94/neoscroll.nvim"})

  use({
    "Pocco81/auto-save.nvim",
  })
  

  use { "wbthomason/packer.nvim", commit = "40b16d7cb9c576973e03db2ebc1320a5732769a8" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim", commit = "968a4b9afec0c633bc369662e78f8c5db0eba249" } -- Useful lua functions used by lots of plugins
  use { "windwp/nvim-autopairs", commit = "fa6876f832ea1b71801c4e481d8feca9a36215ec" } -- Autopairs, integrates with both cmp and treesitter
  use { "numToStr/Comment.nvim", commit = "2c26a00f32b190390b664e56e32fd5347613b9e2" }
  use { "JoosepAlviste/nvim-ts-context-commentstring", commit = "88343753dbe81c227a1c1fd2c8d764afb8d36269" }
  use { "kyazdani42/nvim-web-devicons", commit = "8d2c5337f0a2d0a17de8e751876eeb192b32310e" }
  use { "kyazdani42/nvim-tree.lua", commit = "261a5c380c000e23c4a23dcd55b984c856cdb113" }
  use { "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons", commit = "dd2addade63c977bae47f1b2abe9ef503df1b4d8"}
  use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }
  use { "nvim-lualine/lualine.nvim", commit = "c0510ddec86070dbcacbd291736de27aabbf3bfe" }
  use { "akinsho/toggleterm.nvim", commit = "aaeed9e02167c5e8f00f25156895a6fd95403af8" }
  use { "ahmedkhalf/project.nvim", commit = "541115e762764bc44d7d3bf501b6e367842d3d4f" }
  use { "lewis6991/impatient.nvim", commit = "969f2c5c90457612c09cf2a13fee1adaa986d350" }
  use { "lukas-reineke/indent-blankline.nvim", commit = "6177a59552e35dfb69e1493fd68194e673dc3ee2" }
  use { "goolord/alpha-nvim", commit = "ef27a59e5b4d7b1c2fe1950da3fe5b1c5f3b4c94" }
  use({"folke/which-key.nvim"})
  

  -- Colorschemes
  use { "folke/tokyonight.nvim", commit = "8223c970677e4d88c9b6b6d81bda23daf11062bb" }
  use {"EdenEast/nightfox.nvim"}

  -- cmp plugins
  use { "hrsh7th/nvim-cmp", commit = "df6734aa018d6feb4d76ba6bda94b1aeac2b378a" } -- The completion plugin
  use { "hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323" } -- buffer completions
  use { "hrsh7th/cmp-path", commit = "466b6b8270f7ba89abd59f402c73f63c7331ff6e" } -- path completions
  use { "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" }
  use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }

  -- snippets
  use { "L3MON4D3/LuaSnip", commit = "79b2019c68a2ff5ae4d732d50746c901dd45603a" } --snippet engine
  use { "rafamadriz/friendly-snippets", commit = "d27a83a363e61009278b6598703a763ce9c8e617" } -- a bunch of snippets to use

  -- LSP
  use { "williamboman/mason.nvim", commit = "cb7bdcd2d5a71ffb12127d60bcaad5ba39ab741b" }
  use { "williamboman/mason-lspconfig.nvim", commit = "f0d0d62273b76fa0ef5154ce9d05b1a2a083e79b"}
  use { "neovim/nvim-lspconfig"} -- commit = "148c99bd09b44cf3605151a06869f6b4d4c24455" } -- enable LSP
  -- use { "williamboman/nvim-lsp-installer"}  -- commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6" } -- simple to use language server installer
  use { "jose-elias-alvarez/null-ls.nvim"} -- commit = "ff40739e5be6581899b43385997e39eecdbf9465" } -- for formatters and linters
  -- use { "RRethy/vim-illuminate", -- commit = "c82e6d04f27a41d7fdcad9be0bce5bb59fcb78e5" }

  -- Telescope
  use { "nvim-telescope/telescope.nvim" } --commit = "d96eaa914aab6cfc4adccb34af421bdd496468b0" }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    commit = "518e27589c0463af15463c9d675c65e464efc2fe",
  }

  -- Git
  use { "lewis6991/gitsigns.nvim", commit = "c18e016864c92ecf9775abea1baaa161c28082c3" }

  -- DAP
  use { "mfussenegger/nvim-dap", commit = "014ebd53612cfd42ac8c131e6cec7c194572f21d" }
  use { "rcarriga/nvim-dap-ui", commit = "d76d6594374fb54abf2d94d6a320f3fd6e9bb2f7" }
  use { "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
