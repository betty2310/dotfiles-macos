vim.cmd [[packadd packer.nvim]]

local _packer, packer = pcall(require, "packer")

if not _packer then
    return
end

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "single" }
        end,
        prompt_border = "single",
    },
    git = {
        clone_timeout = 600,
    },
    auto_clean = true,
    compile_on_sync = true,
}

return packer.startup(function()
    use { "wbthomason/packer.nvim" }
    use { "lewis6991/impatient.nvim" }

    -- UI
    use { "betty2310/onenord.nvim" }
    use { "ellisonleao/gruvbox.nvim" }
    use {
        "kyazdani42/nvim-web-devicons",
        config = function()
            require "plugins.configs.icons"
        end,
    }
    use {
        "akinsho/bufferline.nvim",
        after = "nvim-web-devicons",
        config = function()
            require "plugins.configs.bufferline"
        end,
    }
    use {
        "folke/which-key.nvim",
    }
    use {
        "karb94/neoscroll.nvim",
        config = function()
            require "plugins.configs.neoscroll"
        end,
    }
    use {
        "feline-nvim/feline.nvim",
        after = "nvim-web-devicons",
        config = function()
            require "plugins.configs.feline"
        end,
    }

    -- -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        requires = {
            "windwp/nvim-ts-autotag",
            "p00f/nvim-ts-rainbow",
            "nvim-treesitter/nvim-treesitter-textobjects",
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
        run = ":TSUpdate",
        config = function()
            require "plugins.configs.treesitter"
        end,
    }

    -- -- Utilities
    use {
        "kyazdani42/nvim-tree.lua",
        after = "nvim-web-devicons",
        config = function()
            require "plugins.configs.nvimtree"
        end,
    }
    use 'ggandor/lightspeed.nvim'
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-node-modules.nvim",
        },
        config = function()
            require "plugins.configs.telescope"
        end,
    }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require "plugins.configs.indent"
        end,
    }
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require "plugins.configs.trouble"
        end
    }
    use {
        "windwp/nvim-autopairs",
        config = function()
            require "plugins.configs.autopair"
        end,
        setup = function()
            require("utils").packer_lazy_load "nvim-autopairs"
        end,
    }
    use {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require "plugins.configs.color"
        end,
    }
    use { "gpanders/editorconfig.nvim" }

    use {
        "max397574/better-escape.nvim",
        config = function()
            require "plugins.configs.better_escape"
        end
    }


    -- LSP
    use {
        "neovim/nvim-lspconfig",
        requires = {
            "folke/lua-dev.nvim",
            "jose-elias-alvarez/typescript.nvim",
        },
    }
    use {
        "williamboman/nvim-lsp-installer",
    }
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            require "plugins.configs.lspsaga"
        end,
    })
    use {
        "jose-elias-alvarez/null-ls.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    }
    use {
        "j-hui/fidget.nvim",
        config = function()
            require "plugins.configs.fidget"
        end,
    }

    -- -- Comment
    use {
        "numToStr/Comment.nvim",
        config = function()
            require "plugins.configs.comment"
        end,
        setup = function()
            require("utils").packer_lazy_load "Comment.nvim"
        end,
    }

    -- -- Completion
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",
            "hrsh7th/cmp-nvim-lsp-signature-help",
        },
        config = function()
            require "plugins.configs.cmp"
        end,
    }

    -- -- Snippets
    use {
        "dsznajder/vscode-es7-javascript-react-snippets",
        run = "yarn install --frozen-lockfile && yarn compile",
        setup = function()
            require("utils").packer_lazy_load "vscode-es7-javascript-react-snippets"
        end,
    }
    use {
        "rafamadriz/friendly-snippets",
        setup = function()
            require("utils").packer_lazy_load "friendly-snippets"
        end,
    }

    -- Git
    use {
        "lewis6991/gitsigns.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require "plugins.configs.gitsigns"
        end,
        setup = function()
            require("utils").packer_lazy_load "gitsigns.nvim"
        end,
    }

    -- Markdown
    use {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        ft = { "markdown" },
    }
end)
