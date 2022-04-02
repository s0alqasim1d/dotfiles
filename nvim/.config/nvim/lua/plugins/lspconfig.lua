require'lspconfig'.dockerls.setup {
  before_init = function(params)
    params.processId = vim.NIL
  end,
  cmd = require'lspcontainers'.command('dockerls'),
  root_dir = require'lspconfig'.util.root_pattern(".git", vim.fn.getcwd()),
}