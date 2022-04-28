-- Center document when entering insert mode
vim.cmd([[autocmd InsertEnter * norm zz]])

-- Remove trailing whitespace on save
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])

--TODO: Create an augroup
--nvim_create_augroup({name}, {*opts})
--TODO: Create autocmd's for the BufAdd or BufNew event to apply buffer options to new buffers
