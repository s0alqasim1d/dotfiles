-- Center document when entering insert mode
vim.cmd([[autocmd InsertEnter * norm zz]])

-- Remove trailing whitespace on save
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])
