local autogroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

local centaur_auto = "Centaur"
autogroup(centaur_auto) -- Create autocmd_group
autocmd("InsertEnter", {pattern = "*", command = "norm zz", group = centaur_auto })

vim.opt.fileformat = "unix,dos"
vim.opt.listchars:append "eol:↴"
