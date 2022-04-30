-- Center document when entering insert mode
vim.cmd([[autocmd InsertEnter * norm zz]])

-- Remove trailing whitespace on save
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])

--TODO: Create an augroup
--nvim_create_augroup({name}, {*opts})
-- local my_auto_group_id = vim.api.nvim_create_augroup("self_buffer_opts", {
	-- clear = false
-- })
--TODO: Create autocmd's for the BufAdd or BufNew event to apply buffer options to new buffers
-- vim.api.nvim_create_autocmd({"BufAdd"}, {
	-- callback = function ()
		-- require("options.buffer")
	-- end,
	-- group = my_auto_group_id
-- })
