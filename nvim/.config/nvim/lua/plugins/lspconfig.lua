local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")
local lspcontainers = require("lspcontainers")
local capabilities = require"plugins/autocompletion_capabilities"
-- Use a loop to conveniently call "setup" on multiple servers and
-- map buffer local keybindings when the language server attaches

local servers = {
	"bashls",
	"dockerls",
	-- "gopls", has problem with env.HOME not being found
	"html",
	"jsonls",
	"powershell_es",
	"pyright",
	"rust_analyzer",
	"sumneko_lua",
	"tsserver",
	"yamlls",
}
	-- custom language servers because in case they fail, they can't interfere with others loading
local custom_servers = {
	["nginx_ls"] = {
			image = 's0alqasim1d/nginx-ls',
			default_config = {
				cmd = "/venv/bin/nginx-language-server -vv",
				filetypes = { "nginx" },
				root_dir = lspconfig.util.root_pattern("nginx.conf", ".git", vim.fn.getcwd()),
			}
	},
}

local lsp_settings = {
	["sumneko_lua"] = {
		Lua = {
			diagnostics = {
				globals = {"vim", "use", "on_attach"},
			},
        },
	},
	["yamlls"] = {
		yaml = {
			yamlVersion = "1.2",
			trace = { server = "verbose" },
			schemas = {
--				["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master/all.json"] = "/*.k8s.yaml",
				["kubernetes"] = "/*.k8s.yaml",
			},
			schemaDownload = {  enable = true },
			validate = true,
		},
		redhat = { telemetry = { enabled = false } },
	}
}

if not configs["nginx_ls"] then
	configs["nginx_ls"] = { default_config = custom_servers["nginx_ls"].default_config}
end

for _, lsp in pairs(servers) do
	-- print(lsp)
	lspconfig[lsp].setup {
		before_init = function(params)
			params.processId = vim.NIL
		end,
		cmd = lspcontainers.command(lsp),
		root_dir = lspconfig.util.root_pattern(".git", vim.fn.getcwd()),
		on_attach = on_attach,
		flags = {},
		capabilities = capabilities,
		settings = lsp_settings[lsp] or nil
	}
end


for lsp, lsp_opts in pairs(custom_servers) do
	-- print(lsp)
	lspconfig[lsp].setup {
		before_init = function(params)
			params.processId = vim.NIL
		end,
		cmd = lspcontainers.command(lsp, { image = lsp_opts.image }),
		root_dir = lspconfig.util.root_pattern(".git", vim.fn.getcwd()),
		on_attach = on_attach,
		flags = {},
		capabilities = capabilities,
		settings = lsp_settings[lsp] or nil
	}
end

require"plugins/cmp"
