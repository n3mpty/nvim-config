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
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
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
    use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
    -- My plugins here

    use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
    use("nvim-lua/popup.nvim")
    use({ "rcarriga/nvim-notify" })
    use({ "MunifTanjim/nui.nvim" })
    --

    -- ui
    use({ "stevearc/dressing.nvim" })
    use({
        "folke/noice.nvim",
        requires = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "rcarriga/nvim-notify",
            "hrsh7th/nvim-cmp",
        },
    })

    -- Session
    use({ "rmagatti/auto-session", commit = "9639b071d9680764b6e57b08c9fa4a336453558d" })
    use("rmagatti/session-lens")
    --

    use({
        "phaazon/hop.nvim",
        branch = "v2",
        event = "BufRead",
        config = function()
            require("hop").setup({})
        end,
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
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    })

    use({ "Pocco81/auto-save.nvim" })
    -- Color
    use({ "norcalli/nvim-colorizer.lua" })
    -- Better Scroll
    use({ "karb94/neoscroll.nvim" })
    --[[ use({ "declancm/cinnamon.nvim" }) ]]

    -- Rust
    use({ "simrat39/rust-tools.nvim" })

    --- Comment
    use({ "numToStr/Comment.nvim" })
    -- Explorer
    use({ "kyazdani42/nvim-tree.lua" })
    --[[ use({ ]]
    --[[     "nvim-neo-tree/neo-tree.nvim", ]]
    --[[     branch = "v2.x", ]]
    --[[ }) ]]

    --- Bufferline
    --[[ use({ "akinsho/bufferline.nvim" }) ]]
    use({ "romgrk/barbar.nvim" })
    use({ "tiagovla/scope.nvim",
        config = function()
            require("scope").setup()
        end
    })
    use({ "moll/vim-bbye" })
    use({"b0o/incline.nvim"})

    -- Icons
    use("kyazdani42/nvim-web-devicons")

    -- Statusline
    use({ "nvim-lualine/lualine.nvim" })

    -- Terminal
    use({ "akinsho/toggleterm.nvim" })

    -- Project
    use({ "ahmedkhalf/project.nvim" })
    -- Optimaizeer
    use({ "lewis6991/impatient.nvim" })
    -- Indent
    use({ "lukas-reineke/indent-blankline.nvim" })
    -- Dashboard
    use({ "goolord/alpha-nvim" })
    --
    use({ "folke/which-key.nvim" })

    -- Markdown
    use({ "ellisonleao/glow.nvim" })
    use({
        "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
    })
    -- Auto close pairs
    use({ "windwp/nvim-autopairs" })
    --
    -- use({ "tversteeg/registers.nvim",
    --    config = function()
    -- 	require("registers").setup()
    -- end,
    --  })

    -- Colorschemes
    use({ "EdenEast/nightfox.nvim" })
    use({ "catppuccin/nvim", as = "catppuccin" })
    use({ "folke/tokyonight.nvim" })
    use({ "marko-cerovac/material.nvim" })

    -- LSP
    use({
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
            { "jose-elias-alvarez/null-ls.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        }
    })
    -- use("RRethy/vim-illuminate")
    use("j-hui/fidget.nvim")
    use({ "ray-x/lsp_signature.nvim" })
    use("simrat39/symbols-outline.nvim")
    use({ "folke/trouble.nvim", cmd = "TroubleToggle" })
    use("SmiteshP/nvim-navic")

    -- Telescope
    use({ "nvim-telescope/telescope.nvim" })
    use("tom-anders/telescope-vim-bookmarks.nvim")

    -- Treesitter
    use({ "nvim-treesitter/nvim-treesitter",
        requires = {
            "JoosepAlviste/nvim-ts-context-commentstring",
            "p00f/nvim-ts-rainbow",
        }
    })

    -- Git
    use({ "lewis6991/gitsigns.nvim" })
    use({ "sindrets/diffview.nvim" })

    -- DAP
    use({ "mfussenegger/nvim-dap",
        requires = {
            "rcarriga/nvim-dap-ui",
            "ravenxrz/DAPInstall.nvim",
        }
    })
    -- Visualise undo
    use({ "mbbill/undotree" })
    -- 
    --[[ use({ "ntpeters/vim-better-whitespace" }) ]]
    use({ "folke/zen-mode.nvim" })
    --
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
