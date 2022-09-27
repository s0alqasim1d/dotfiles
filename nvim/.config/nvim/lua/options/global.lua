require('os')
local o = vim.o								-- Global Options
local homedir = os.getenv('HOME') or os.getenv('USERPROFILE')
if homedir == nil then
	homedir = 'c:/users/s.alqasim'
end
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
o.undodir = homedir .. "/.cache/nvim/undodir/"
-- o.shell = os.getenv("SHELL") or "pwsh"
o.shell = 'pwsh'
o.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
o.shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait'
o.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
o.shellquote = ''
o.shellxquote = ''
o.showtabline = 2 							-- Always show buffer tabs
o.splitbelow = true 						-- Hsplit below
o.splitright = true							-- Vsplit to the right
o.laststatus = 3							-- Show one statusline always
