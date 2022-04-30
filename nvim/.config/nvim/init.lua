require('options.global')		-- lua/options
require('options.window')		-- lua/options
require('options.buffer')		-- lua/options
require('plugins')		-- lua/plugins
require('keymaps')		-- lua/keymaps
require('autocmds')		-- lua/autocmds
vim.g.gruvbox_material_transparent_background = 1
vim.cmd(':silent! colorscheme gruvbox-material') -- Set colorscheme to whatever, but fail silently
-- vim.g['oak_virtualtext_bg'] = 1
-- vim.cmd(':silent! colorscheme oak')
