require('os')
local opt = vim.opt
local g = vim.g
local homedir = os.getenv('HOME') or os.getenv('USERPROFILE')
if homedir == nil then
	homedir = 'c:/users/s.alqasim'
end
--===================Global Options===================
g.mapleader = " "

opt.autoindent = true 						-- Auto indent
opt.cmdheight = 1 							-- Space for cmd messages
opt.conceallevel = 0 							-- Show `` in markdown files
opt.fileencoding = "utf-8" 					-- File encoding
opt.laststatus = 2 							-- Always display the status line
opt.pumheight = 10 							-- Popup menu height
opt.showmode = false 							-- Hide the editing mode
opt.writebackup = false 						-- This is recommended by coc
opt.updatetime = 250							-- Faster completion
opt.timeoutlen = 400 							-- By default timeoutlen is 1000 ms
opt.hlsearch = false							-- Don't keep highlight on search
opt.incsearch = true							-- Update search results as you type
opt.ignorecase = false						-- Don't ignore case in search patterns
opt.scrolloff = 8								-- Start scrolling 8 lines away
opt.smartindent = true 						-- Makes indenting smart
opt.smarttab = true
opt.expandtab = true
opt.softtabstop = true
-- opt.smartcase = true
opt.termguicolors = true						-- Enables 24-bit RGB color
opt.wildmode ='longest,list,full'				-- Complete till longest common
											-- string, list all matches,
											--complete the next full match
opt.wildmenu = true
opt.wildignore= '*.pyc,*_build/*,**/coverage/*,**/node_modules/*,**/android/*,**/ios/*,**/.git/*'
opt.clipboard = 'unnamedplus'					-- Share clipboard between system & vim
opt.mouse = 'a'								-- Enable mouse
opt.swapfile = false							-- Disable swapfile
opt.backup = false							-- disable backup
opt.undodir = homedir .. "/.cache/nvim/undodir/"
-- opt.shell = os.getenv("SHELL") or "pwsh"
opt.shell = 'pwsh'
opt.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
opt.shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait'
opt.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
opt.shellquote = ''
opt.shellxquote = ''
opt.showtabline = 2 							-- Always show buffer tabs
opt.splitbelow = true 						-- Hsplit below
opt.splitright = true							-- Vsplit to the right
opt.laststatus = 3							-- Show one statusline always
opt.fillchars = { eob = " " }
--
-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

opt.title = true
opt.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
--===================Window Options===================
opt.number = true							-- Show line numbers
opt.relativenumber = true					-- Give relative numbers to lines
											-- around current line
opt.cursorline = true						-- Highlight line cursor is on
--opt.cursorcolumn = true
--
--===================Buffer Options===================
opt.tabstop = 4								-- Number of spaces a tab counts for
opt.shiftwidth = 4							-- Number of spaces an auto indent tab counts for
opt.syntax = 'on'							-- Enable syntax highlighting
opt.undofile = true							-- Use undo file
opt.fileformat = 'unix'
opt.fileformats = 'unix,dos'
-- opt.iskeyword = bopt.iskeyword .. ',-'
-- opt.shortmess = bopt.shortmess .. ',c'
-- for lack of a cleaner way to add to a list
--vim.cmd('set iskeyword+=-') 				-- Count '-' as a word
-- vim.cmd('set shortmess+=c') 				-- Don't give |ins-completion-menu| messages.

local default_plugins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "syntax",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
}

for _, plugin in pairs(default_plugins) do
  g["loaded_" .. plugin] = 1
end

local default_providers = {
  "node",
  "perl",
  "python3",
  "ruby",
}

for _, provider in ipairs(default_providers) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end
