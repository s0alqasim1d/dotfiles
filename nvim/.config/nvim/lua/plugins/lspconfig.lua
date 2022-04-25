local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")
local lspcontainers = require("lspcontainers")
local capabilities = require"plugins/autocompletion_capabilities"
-- Use a loop to conveniently call "setup" on multiple servers and
-- map buffer local keybindings when the language server attaches

local servers = {
	bashls = nil,
	dockerls = nil,
	-- "gopls", has problem with env.HOME not being found
	html = nil,
	jsonls = nil,
	powershell_es = nil,
	pyright = nil,
	rust_analyzer = nil,
	sumneko_lua = {
		settings = {
			Lua = {
				diagnostics = {
					globals = {"vim", "use", "on_attach"},
				},
        	},
		},
	},
	tsserver = nil,
	yamlls = {
		settings = {
			yaml = {
				yamlVersion = "1.2",
				trace = { server = "verbose" },
				schemas = {
	--				https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master/all.json = "/*.k8s.yaml",
					kubernetes = "/*.k8s.yaml",
				},
				schemaDownload = {  enable = true },
				validate = true,
			},
			redhat = { telemetry = { enabled = false } },
		}
	},
	-- Custom LSP
	nginx_ls = {
			image = "s0alqasim1d/nginx-ls",
			default_config = {
				cmd = "/venv/bin/nginx-language-server -vv",
				filetypes = { "nginx" },
				root_dir = lspconfig.util.root_pattern("nginx.conf", ".git", vim.fn.getcwd()),
			}
	},
}

for lsp, lsp_opts in pairs(servers) do
	 --print(lsp)
	if not lspcontainers.supported_languages[lsp] then
		print(lsp .. " has config issue")
		configs[lsp] = { default_config = lsp_opts.default_config}
	end
	lspconfig[lsp].setup {
		before_init = function(params)
			params.processId = vim.NIL
		end,
		cmd = lsp_opts.image ~= nil and lspcontainers.command(lsp, { image = lsp_opts.image }) or lspcontainers.command(lsp),
		root_dir = lspconfig.util.root_pattern(".git", vim.fn.getcwd()),
		on_attach = on_attach,
		flags = nil,
		capabilities = capabilities,
		settings = lsp_opts.settings or nil
	}
end

require"plugins/cmp"
