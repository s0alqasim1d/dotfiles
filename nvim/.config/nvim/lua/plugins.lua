return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	
----------------- Related to Colors/Themes -----------------------
	-- Color scheme "fromthehell"
	use 'szorfein/fromthehell.vim'
	-- Color scheme "material"
	use {'kaicataldo/material.vim', branch = 'main' }
	-- Color scheme "landscape"
	use 'itchyny/landscape.vim'
	-- Color scheme "vim-afterglow"
	use 'danilo-augusto/vim-afterglow'
	-- Color scheme "lampaces-demon-vim"
	use 'epmor/lampaces-demon-vim'
	-- Color scheme "vim-colorscheme-primary"
	use 'google/vim-colorscheme-primary'
	-- Color scheme "tender"
	use 'jacoborus/tender.vim'
	-- Color scheme "vim-moonfly-colors"
	use 'bluz71/vim-moonfly-colors'
	-- Color scheme "spacecamp"
	use 'jaredgorski/spacecamp'
	-- Color scheme "vim-one"
	use 'rakr/vim-one'
	-- Color scheme "vim-detailed"
	use 'rking/vim-detailed'
	-- Color scheme "Calvera-dark"
	use 'yashguptaz/calvera-dark.nvim'
	
----------------- Related to Windows -----------------------
	-- Simpler keymapper in Lua
	use 'Iron-E/nvim-cartographer'

	-- Maximizer
	use 'szw/vim-maximizer'
	
	-- NVim Tree
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {{'kyazdani42/nvim-web-devicons'}}
	}
		
	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
	}
	
	-- Dashboard
	use 'glepnir/dashboard-nvim'
	
	
	-- Shade inactive windows 
	-- use {
		-- 'sunjon/shade.nvim',
		-- config = function() require'shade'.setup({
			-- overlay_opacity = 50,
			-- opacity_step = 1,
			-- keys = {
				-- brightness_up    = '<C-Up>',
				-- brightness_down  = '<C-Down>',
				-- toggle           = '<Leader>s',
			-- }
		-- }) end
	-- }
----------------- Related to Buffers -----------------------
	-- Highlight Search Lens
	use {'kevinhwang91/nvim-hlslens'}
	
	-- git messenger
	use 'rhysd/git-messenger.vim'
	
	-- Multicursors
	use { 'mg979/vim-visual-multi', branch = 'master' }
	
	-- Smooth Scroll
	use 'karb94/neoscroll.nvim'

	-- nvim buffers/tabs line
	use {'akinsho/nvim-bufferline.lua', config = function() require("plugins/bufferline") end, requires = 'kyazdani42/nvim-web-devicons'}
	
	-- Git Blame/Signs
	use {
		'lewis6991/gitsigns.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		},
		config = function() require('gitsigns').setup() end
	}
	
	-- Custom Status line
	use {
		'glepnir/galaxyline.nvim',
		branch = 'main',
		-- your statusline
		config = function() require'plugins/statusline' end, --don't have config yet
		-- some optional icons
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}
	
	-- autoclose & autorename tags closely related to nvim-treesitter || Look at later
	--use 'windwp/nvim-ts-autotag'
	
	-- Neovim TreeSitter
	use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
	
	-- Peek via numbers
	use {
		'nacro90/numb.nvim',
		config = function() require('numb').setup{
		   show_numbers = true, -- Enable 'number' for the window while peeking
		   show_cursorline = true, -- Enable 'cursorline' for the window while peeking
		   number_only = false -- Peek only when the command is only a number instead of when it starts with a number
		} end
	}
	
	-- Specs [find cursor easier]
	use {
		'edluffy/specs.nvim',
		config = function() require('specs').setup{ 
			show_jumps  = true,
			min_jump = 10,
			popup = {
				delay_ms = 10, -- delay before popup displays
				inc_ms = 10, -- time increments used for fade/resize effects 
				blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
				width = 10,
				winhl = "PMenu",
				fader = require('specs').pulse_fader,
				resizer = require('specs').shrink_resizer
			},
			ignore_filetypes = {},
			ignore_buftypes = {
				nofile = true,
			},
		}	end
	}
	
	-- Colorizer for hex colors
	use {
		'norcalli/nvim-colorizer.lua',
		config = function() require 'colorizer'.setup {
			'css';
			'javascript';
			html = {
				mode = 'foreground';
			}
		} end
	
	}
	
	-- UltTest
	use { 'rcarriga/vim-ultest', requires = {'vim-test/vim-test'}, run = ':UpdateRemotePlugins' }
	-- Neovim LSP-Config
	use 'neovim/nvim-lspconfig'
	-- Neovim LSP Saga
	use 'glepnir/lspsaga.nvim'
	-- Lsp Status
	use 'nvim-lua/lsp-status.nvim'
----------------- Related to Keys -----------------------
	use 'ThePrimeagen/vim-be-good'
	
	-- Which-key wrapper for easier setup
	use {
		'AckslD/nvim-whichkey-setup.lua',
		requires = {'liuchengxu/vim-which-key'},
	}
	
end)