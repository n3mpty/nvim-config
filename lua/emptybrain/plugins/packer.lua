local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use({

		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	})
	use("simrat39/symbols-outline.nvim")

	use({
		"Shatur/neovim-session-manager",
		as = "session_manager",
		cmd = "SessionManager",
		event = "BufWritePost",
	})
	use({

		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function()
			require("lsp_signature").on_attach({
				bind = true,
				handlers_opts = {
					border = "single",
					hint_prefix = "🐀",
				},
			})
		end,
	})
	use({
		"phaazon/hop.nvim",
		branch = "v2",
		event = "BufRead",
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
			require("specs").setup({
				show_jumps = true,
				min_jump = 2,
				popup = {
					inc_ms = 10,
					blend = 10,
					width = 20,
					winhl = "Pmenu",
					fader = require("specs").linear_fader,
					resizer = require("specs").shrink_resizer,
				},
				ignore_filetypes = {},
				ignore_buftypes = {
					nofile = true,
				},
			})
		end,
	})

	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	})
	use({ "norcalli/nvim-colorizer.lua" })

	use({ "kshenoy/vim-signature" })

	use({ "karb94/neoscroll.nvim" })
	use({ "Pocco81/auto-save.nvim" })

	use({ "simrat39/rust-tools.nvim" })

	use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used by lots of plugins
	use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "kyazdani42/nvim-tree.lua" })
	use({ "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" })
	use({ "moll/vim-bbye" })
	use({ "nvim-lualine/lualine.nvim" })
	use({ "akinsho/toggleterm.nvim" })
	use({ "ahmedkhalf/project.nvim" })
	use({ "lewis6991/impatient.nvim" })
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({ "goolord/alpha-nvim" })
	use({ "folke/which-key.nvim" })
	use({ "ellisonleao/glow.nvim" })
    use({"rstacruz/vim-closer"})

	-- Colorschemes
	use({ "EdenEast/nightfox.nvim" })
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- cmp plugins
	use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-path" }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })

	-- snippets
	use({ "L3MON4D3/LuaSnip" }) --snippet engine
	use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

	-- LSP
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "neovim/nvim-lspconfig" }) -- commit = "148c99bd09b44cf3605151a06869f6b4d4c24455" } -- enable LSP
	-- use { "williamboman/nvim-lsp-installer"}  -- commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6" } -- simple to use language server installer
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- commit = "ff40739e5be6581899b43385997e39eecdbf9465" } -- for formatters and linters
	-- [[ use { "RRethy/vim-illuminate"} ]]

	-- Telescope
	use({ "nvim-telescope/telescope.nvim" }) --commit = "d96eaa914aab6cfc4adccb34af421bdd496468b0" }

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		commit = "518e27589c0463af15463c9d675c65e464efc2fe",
	})

	-- Git
	use({ "lewis6991/gitsigns.nvim" })

	-- DAP
	use({ "mfussenegger/nvim-dap" })
	use({ "rcarriga/nvim-dap-ui" })
	use({ "ravenxrz/DAPInstall.nvim" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
