local hasMap, map = pcall(require, 'cartographer')
if hasMap then
	-- ================================ NORMAL ====================================
	-- Split navigation
	local nmap_silent = map.n.silent

	nmap_silent['<M-h>'] = '<C-w>h'
	nmap_silent['<M-j>'] = '<C-w>j'
	nmap_silent['<M-k>'] = '<C-w>k'
	nmap_silent['<M-l>'] = '<C-w>l'

	-- map('n', '<M-h>', '<C-w>h', {silent = true})
	-- map('n', '<M-j>', '<C-w>j', {silent = true})
	-- map('n', '<M-k>', '<C-w>k', {silent = true})
	-- map('n', '<M-l>', '<C-w>l', {silent = true})

	-- Buffer navigation
	local nnoremap_silent = nmap_silent.nore

	nnoremap_silent['<C-T>'] = ':<CR>'
	nnoremap_silent['<M->>'] = ':BufferLineCycleNext<CR>'
	nnoremap_silent['<M-<>'] = ':BufferLineCyclePrev<CR>'
	-- map('n', '<C-T>', ':BufferNext<CR>', {noremap = true, silent = true})
	-- map('n', '<M-TAB>', ':BufferNext<CR>', {noremap = true, silent = true})
	-- map('n', '<S-TAB>', ':BufferPrev<CR>', {noremap = true, silent = true})

	-- File navigation
	nnoremap_silent['<C-y>'] = '3<C-y>'
	nnoremap_silent['<C-e>'] = '3<C-e>'
	-- map('n', '<C-y>', '3<C-y>', {noremap = true, silent = true})
	-- map('n', '<C-e>', '3<C-e>', {noremap = true, silent = true})

	-- Resizing
	nnoremap_silent['<C-Up>'] = ':resize +2<CR>'
	nnoremap_silent['<C-Down>'] = ':resize -2<CR>'
	nnoremap_silent['<C-Right>'] = ':vert resize +2<CR>'
	nnoremap_silent['<C-Left>'] = ':vert resize -2<CR>'

	-- map('n', '<C-Up>', ':resize +2<CR>', {noremap = true, silent = true})
	-- map('n', '<C-Down>', ':resize -2<CR>', {noremap = true, silent = true})
	-- map('n', '<C-Right>', ':vert resize +2<CR>', {noremap = true, silent = true})
	-- map('n', '<C-Left>', ':vert resize -2<CR>', {noremap = true, silent = true})

	-- LSP
	nnoremap_silent['K'] = ':Lspsaga hover_doc<CR>'
	nnoremap_silent['gd'] = '<cmd>lua vim.lsp.buf.definition()<CR>'
	nnoremap_silent['gD'] = '<cmd>lua vim.lsp.buf.declaration()<CR>'
	-- nnoremap_silent['gp'] = '<cmd>lua vim.lsp.buf.preview()<CR>'
	nnoremap_silent['gr'] = '<cmd>lua vim.lsp.buf.references()<CR>'
	nnoremap_silent['gi'] = '<cmd>lua vim.lsp.buf.implementation()<CR>'
	nnoremap_silent['<C-p>'] = ':Lspsaga diagnostic_jump_prev<CR>'
	nnoremap_silent['<C-n>'] = ':Lspsaga diagnostic_jump_next<CR>'

	-- map('n', 'K', ':Lspsaga hover_doc<CR>', {noremap = true, silent = true})
	-- map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
	-- map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', {noremap = true, silent = true})
	-- map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {noremap = true, silent = true})
	-- map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {noremap = true, silent = true})
	-- map('n', 'ca', ':Lspsaga code_action<CR>', { noremap=true, silent=true }) -- in whichkey was commented already
	-- map('n', '<C-p>', ':Lspsaga diagnostic_jump_prev<CR>', {noremap = true, silent = true})
	-- map('n', '<C-n>', ':Lspsaga diagnostic_jump_next<CR>', {noremap = true, silent = true})

	-- scroll down hover doc or scroll in definition preview
	nnoremap_silent['<Down>'] = '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(1)<CR>'
	-- map('n', '<Down>','<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(1)<CR>', {noremap = true, silent = true})

	-- scroll up hover doc
	nnoremap_silent['<Up>'] = '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(-1)<CR>'
	-- map('n', '<Up>', '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(-1)<CR>', {noremap = true, silent = true})

	-- Center screen after search forward/backward
	local nnoremap = map.n.nore
	nnoremap['n'] = 'nzzzv'
	nnoremap['N'] = 'Nzzzv'

	-- ================================ INSERT ====================================

	-- ================================ VISUAL ====================================
	-- Indenting
	local vnoremap_silent = map.v.nore.silent
	vnoremap_silent['<'] = '<gv'
	vnoremap_silent['>'] = '<gv'

	-- map('v', '<', '<gv', {noremap = true, silent = true})
	-- map('v', '>', '>gv', {noremap = true, silent = true})

	-- Move line Up and Down
	vnoremap_silent['K'] = ':m \'>-2<CR>gv-gv'
	vnoremap_silent['J'] = ':m \'>+1<CR>gv-gv'
	-- map('v', 'K', ':m \'>-2<CR>gv-gv', {noremap = true, silent = true})

	-- ================================ UNMAP =====================================
	nnoremap_silent['Q'] = '<NOP>'
	-- map('n', 'Q', '<NOP>', {noremap = true, silent = true})
else

end
