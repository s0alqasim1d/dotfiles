local o = vim.o		-- Global Settings
local wo = vim.wo	-- Window Settings
local bo = vim.bo	-- Buffer Settings

-- Global Options
o.swapfile = true
o.dir = '/tmp'
o.smartcase = true
o.laststatus = 2
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.scrolloff = 8
o.termguicolors = true
o.wildmode ='longest,list,full'
o.wildmenu = true

o.wildignore= '*.pyc,*_build/*,**/coverage/*,**/node_modules/*,**/android/*,**/ios/*,**/.git/*'

-- Window Options
wo.number = true
wo.relativenumber = true

-- Buffer Options

bo.tabstop = 4
bo.syntax = 'on'