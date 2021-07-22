local o = vim.o								-- Global Options
local wo = vim.wo							-- Window Options
local bo = vim.bo							-- Buffer Options

--===================Global Options===================
o.autoindent = true 						-- Auto indent
o.cmdheight = 1 							-- Space for cmd messages
o.conceallevel = 0 							-- Show `` in markdown files
o.fileencoding = "utf-8" 					-- File encoding
o.laststatus = 2 							-- Always display the status line
o.pumheight = 10 							-- Popup menu height
o.showmode = false 							-- Hide the editing mode
o.writebackup = false 						-- This is recommended by coc
o.updatetime = 300 							-- Faster completion
o.timeoutlen = 500 							-- By default timeoutlen is 1000 ms
o.hlsearch = false							-- Don't keep highlight on search
o.incsearch = true							-- Update search results as you type
o.ignorecase = false						-- Don't ignore case in search patterns
o.scrolloff = 8								-- Start scrolling 8 lines away
o.smartindent = true 						-- Makes indenting smart
o.smarttab = true							
-- o.smartcase = true				
o.termguicolors = true						-- Enables 24-bit RGB color
o.wildmode ='longest,list,full'				-- Complete till longest common
											-- string, list all matches,
											--complete the next full match
o.wildmenu = true
o.wildignore= '*.pyc,*_build/*,**/coverage/*,**/node_modules/*,**/android/*,**/ios/*,**/.git/*'
o.clipboard = 'unnamedplus'					-- Share clipboard between system & vim
o.mouse = 'a'								-- Enable mouse
o.swapfile = false							-- Disable swapfile
o.backup = false							-- disable backup
o.undodir = '$XDG_DATA_HOME/nvim/undo'
o.shell = '/bin/zsh'						-- Set default shell
o.showtabline = 2 							-- Always show buffer tabs
o.splitbelow = true 						-- Hsplit below
o.splitright = true							-- Vsplit to the right

--===================Window Options===================
wo.number = true							-- Show line numbers
wo.relativenumber = true					-- Give relative numbers to lines
											-- around current line

wo.cursorline = true						-- Highlight line cursor is on
--wo.cursorcolumn = true

--===================Buffer Options===================

bo.tabstop = 4								-- Number of spaces a tab counts for
bo.syntax = 'on'							-- Enable syntax highlighting
bo.undofile = true							-- Use undo file
-- bo.iskeyword = bo.iskeyword .. ',-'
-- bo.shortmess = bo.shortmess .. ',c'
-- for lack of a cleaner way to add to a list
vim.cmd('set iskeyword+=-') 				-- Count '-' as a word
vim.cmd('set shortmess+=c') 				-- Don't give |ins-completion-menu| messages.