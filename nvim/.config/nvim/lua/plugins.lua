return require("packer").startup(function()
	-- Packer can manage itself
	use "wbthomason/packer.nvim"
	-- Implements a chunk cache to speed up neovim startup
	use "lewis6991/impatient.nvim"
----------------- Related to Windows -----------------------
	-- Maximizer
--	use "szw/vim-maximizer"
	-- Notify notification engine
	use { "rcarriga/nvim-notify", config = [[require("plugins.notify")]]}
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
	use {"kevinhwang91/nvim-hlslens"}

	-- git messenger
	use "rhysd/git-messenger.vim"

	-- Multicursors
	use { "mg979/vim-visual-multi", branch = "master" }

	-- Smooth Scroll
	-- use {	"karb94/neoscroll.nvim",
	-- 		config = function() require("neoscroll").setup({
	-- 			-- All these keys will be mapped to their corresponding default scrolling animation
	-- 			mappings = {"<C-u>", "<C-d>", "<C-b>", "<C-f>",
	-- 						"<C-y>", "<C-e>", "zt", "zz", "zb"},
	-- 			hide_cursor = true,          -- Hide cursor while scrolling
	-- 			stop_eof = true,             -- Stop at <EOF> when scrolling downwards
	-- 			use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
	-- 			respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
	-- 			cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
	-- 			easing_function = nil,       -- Default easing function
	-- 			pre_hook = nil,              -- Function to run before the scrolling animation starts
	-- 			post_hook = nil,             -- Function to run after the scrolling animation ends
	-- 			performance_mode = true,    -- Disable "Performance Mode" on all buffers.
	-- 		}) end
	-- }

	-- nvim buffers/tabs line
	use {"akinsho/nvim-bufferline.lua", config = [[require("plugins/bufferline")]], requires = "kyazdani42/nvim-web-devicons"}

	-- Git Blame/Signs
	use {
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim"
		},
		config = [[require("gitsigns").setup()]]
	}

	-- Custom Status line
	use {
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = [[require"plugins/statusline"]],
	}

	-- autoclose & autorename tags closely related to nvim-treesitter || Look at later
	--use "windwp/nvim-ts-autotag"

	-- Neovim TreeSitter
	use {
		"nvim-treesitter/nvim-treesitter",
		requires = {
		      "nvim-treesitter/nvim-treesitter-refactor",
		      "RRethy/nvim-treesitter-textsubjects",
		},
		run = ":TSUpdate",
		config = [[require"plugins/treesitter"]]
	}
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
			"hrsh7th/nvim-cmp",
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
end)
