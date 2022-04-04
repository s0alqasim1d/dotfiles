-- Use a loop to conveniently call "setup" on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
	"bashls",
	"dockerls",
	-- "gopls", has problem with env.HOME not being found
	"html",
	"jsonls",
	"pyright",
	"rust_analyzer",
	"sumneko_lua",
	"tsserver",
	"yamlls"
}

for _, lsp in pairs(servers) do
	-- print(lsp)
	require("lspconfig")[lsp].setup {
		before_init = function(params)
			params.processId = vim.NIL
		end,
		cmd = require"lspcontainers".command(lsp),
		root_dir = require"lspconfig".util.root_pattern(".git", vim.fn.getcwd()),
		on_attach = on_attach,
		flags = {
		  -- This will be the default in neovim 0.7+
		  debounce_text_changes = 150,
		}
	}
end
