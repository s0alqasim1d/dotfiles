return require("packer").startup({function()
	-- Packer can manage itself
	use "wbthomason/packer.nvim"
	-- Implements a chunk cache to speed up neovim startup
	use "lewis6991/impatient.nvim"
	use "dstein64/vim-startuptime"
----------------- Related to Windows -----------------------
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}
	use({
	  "folke/noice.nvim",
	  event = "VimEnter",
	  config = [[require("noice").setup()]],
	  requires = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- { "rcarriga/nvim-notify", config = [[require("plugins.notify")]]},
		"rcarriga/nvim-notify",
		{ "hrsh7th/nvim-cmp", config=[[require("plugins.cmp")]]},
		}
	})
	-- NVim Tree
	use {
		"kyazdani42/nvim-tree.lua",
		requires = {{"kyazdani42/nvim-web-devicons"}}
	}

	-- Telescope
	use {
		"nvim-telescope/telescope.nvim",
		requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
	}
	use { "stevearc/dressing.nvim", config = [[require("plugins.dressing")]] }
	-- todo-comments
	use { "folke/todo-comments.nvim",
	  requires = "nvim-lua/plenary.nvim", config = function() require("todo-comments").setup{} end
	}
	-- Comment
	use { "numToStr/Comment.nvim", config = [[require("Comment").setup()]] }
	-- Dashboard
	use "glepnir/dashboard-nvim"

----------------- Related to Buffers -----------------------
	-- Highlight Search Lens
	use "kevinhwang91/nvim-hlslens"

	-- git messenger
	use "rhysd/git-messenger.vim"

	-- Multicursors
	use { "mg979/vim-visual-multi", branch = "master" }

	-- nvim buffers/tabs line
	use {
		"akinsho/nvim-bufferline.lua",
		tag = "v2.*",
		config = [[require("plugins/bufferline")]],
		requires = "kyazdani42/nvim-web-devicons"
	}

	-- Git Blame/Signs
	use {
		"lewis6991/gitsigns.nvim",
		config = function() require("plugins/gitsigns") end
	}

	-- Custom Status line
	use {
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = [[require"plugins/statusline"]],
	}


	-- Neovim TreeSitter
	use {
		"nvim-treesitter/nvim-treesitter",
		run = [[require('nvim-treesitter.install').update({ with_sync = true })]],
		config = [[require"plugins/treesitter"]]
	}
	use "RRethy/nvim-treesitter-textsubjects"

	use "nvim-treesitter/nvim-treesitter-refactor"

	-- autoclose & autorename tags nvim-treesitter
	use "windwp/nvim-ts-autotag"

	-- nvim-gps
	 use {
		"SmiteshP/nvim-gps",
		requires = "nvim-treesitter/nvim-treesitter",
		config = [[require("nvim-gps").setup()]],
	}
	-- indent line
	use { "lukas-reineke/indent-blankline.nvim",
		requires = {
			"nvim-treesitter/nvim-treesitter"
		},
		config = function ()
			vim.opt.list = true
			--vim.opt.listchars:append("space:⋅")
			vim.opt.listchars:append("eol:↴")
			require("indent_blankline").setup {
					buftype_exclude = { "terminal" },
					filetype_exclude = { "dashboard" },
    				space_char_blankline = " ",
    				show_current_context = true,
					show_current_context_start = true,
			}
		end
	}

	-- Peek via numbers
	use {
		"nacro90/numb.nvim",
		config = function() require("numb").setup{
		   show_numbers = true, -- Enable "number" for the window while peeking
		   show_cursorline = true, -- Enable "cursorline" for the window while peeking
		   number_only = false -- Peek only when the command is only a number instead of when it starts with a number
		} end
	}

	-- Specs [find cursor easier]
	use {
		"edluffy/specs.nvim",
		config = function() require("specs").setup{
			show_jumps  = true,
			min_jump = 10,
			popup = {
				delay_ms = 10, -- delay before popup displays
				inc_ms = 10, -- time increments used for fade/resize effects
				blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
				width = 10,
				winhl = "PMenu",
				fader = require("specs").pulse_fader,
				resizer = require("specs").shrink_resizer
			},
			ignore_filetypes = {},
			ignore_buftypes = {
				nofile = true,
			},
		}	end
	}

	-- Colorizer for hex colors
	use {
		"norcalli/nvim-colorizer.lua",
		config = function() require "colorizer".setup {
			"css";
			"javascript";
			html = {
				mode = "foreground";
			}
		} end

	}
	-- Glow MD veiwer
	use {"ellisonleao/glow.nvim", branch = 'main'}
	-- UltTest
	-- use { "rcarriga/vim-ultest", requires = {"vim-test/vim-test"}, run = ":UpdateRemotePlugins" }

		use { "tami5/lspsaga.nvim", config = [[require("plugins.lspsaga")]] }
	-- Neovim LSPContainers
	use { "lspcontainers/lspcontainers.nvim",
		requires = {
			"neovim/nvim-lspconfig",
			{ "hrsh7th/nvim-cmp", config=[[require("plugins.cmp")]]},
			-- "hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			{
				"rafamadriz/friendly-snippets",
				requires = { "L3MON4D3/LuaSnip", },
				config = [[require("plugins.snippets")]]
			}
		},
		config = [[require"plugins/lspconfig"]]
	}
-- Clipboard Manager
	use {
	  "AckslD/nvim-neoclip.lua",
	  requires = {
		{'tami5/sqlite.lua', module = 'sqlite'},
		{'nvim-telescope/telescope.nvim'},
	  },
	  config = [[require('neoclip').setup()]],
	}
	-- Lsp Status
	use "nvim-lua/lsp-status.nvim"
	-- Trouble diagnostics
	use {
	  "folke/trouble.nvim",
	  requires = "kyazdani42/nvim-web-devicons",
	  config = function()
		require("trouble").setup {
		  -- your configuration comes here
		  -- or leave it empty to use the default settings
		  -- refer to the configuration section below
		}
	  end
}
----------------- Related to Keys -----------------------
	-- Simpler keymapper in Lua
	use "Iron-E/nvim-cartographer"

	use "ThePrimeagen/vim-be-good"

	-- Which-key wrapper for easier setup
	use {
		"AckslD/nvim-whichkey-setup.lua",
		requires = {"liuchengxu/vim-which-key"},
	}
---------------Misc-------------------------------------------
	-- use {'andweeb/presence.nvim', config = [[require("plugins.presence")]]}
----------------- Related to Colors/Themes -----------------------
	-- Color scheme "fromthehell"
	use "szorfein/fromthehell.vim"
	-- Color scheme "material"
	use {"kaicataldo/material.vim", branch = "main" }
	-- Color scheme "landscape"
	use "itchyny/landscape.vim"
	-- Color scheme "vim-afterglow"
	use "danilo-augusto/vim-afterglow"
	-- Color scheme "vim-colorscheme-primary"
	use "google/vim-colorscheme-primary"
	-- Color scheme "tender"
	use "jacoborus/tender.vim"
	-- Color scheme "vim-moonfly-colors"
	use "bluz71/vim-moonfly-colors"
	-- Color scheme "spacecamp"
	use "jaredgorski/spacecamp"
	-- Color scheme "vim-one"
	use "rakr/vim-one"
	-- Color scheme "vim-detailed"
	use "rking/vim-detailed"
	-- Color scheme "Calvera-dark"
	use "yashguptaz/calvera-dark.nvim"
	-- This is not a colorscheme
	use "rktjmp/lush.nvim"
	-- Color scheme "seoul256"
	use "junegunn/seoul256.vim"
	-- Color scheme "sonokai"
	use "sainnhe/sonokai"
	-- Color scheme "tokyonight"
	use "ghifarit53/tokyonight-vim"
	-- Color scheme "synthwave84"
	use "artanikin/vim-synthwave84"
	-- Color scheme "shades-of-purple"
	use "Rigellute/shades-of-purple.vim"
	-- Color scheme "cyberpunk"
	use "thedenisnikulin/vim-cyberpunk"
	-- Color scheme "eldar"
	use "agude/vim-eldar"
	-- Color scheme "lucid"
	use "cseelus/vim-colors-lucid"
	-- Color scheme "papercolor"
	use "NLKNguyen/papercolor-theme"
	-- Color scheme "ayu"
	use "ayu-theme/ayu-vim"
	-- Color scheme "oak"
	use "vigoux/oak"
	-- Color scheme "melange"
	use "savq/melange"
	-- Color scheme "kimbox"
	--use "/kimbox"
	-- gruvbox-material
	use "sainnhe/gruvbox-material"
end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
}})
