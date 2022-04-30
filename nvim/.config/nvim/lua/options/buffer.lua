local bo = vim.o							-- Buffer Options
--===================Buffer Options===================
bo.tabstop = 4								-- Number of spaces a tab counts for
bo.shiftwidth = 4							-- Number of spaces an auto indent tab counts for
bo.syntax = 'on'							-- Enable syntax highlighting
bo.undofile = true							-- Use undo file
-- bo.iskeyword = bo.iskeyword .. ',-'
-- bo.shortmess = bo.shortmess .. ',c'
-- for lack of a cleaner way to add to a list
--vim.cmd('set iskeyword+=-') 				-- Count '-' as a word
vim.cmd('set shortmess+=c') 				-- Don't give |ins-completion-menu| messages.
